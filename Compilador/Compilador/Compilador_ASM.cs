using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Compilador
{
    public class Compilador_ASM
    {
        private string _path;
        private int _default_pc = 0;
        private string _error = "File Compiled!";
        private string _bin_file = "";
        private string _hex_file = "";


        private List<List<string>> _tokens = new List<List<string>>();
        private List<String> _instructions_type1 = new List<string>(new string[] 
                            {"add","sub","mult"});
        private List<String> _instructions_type2 = new List<string>(new string[]
                            {"lw","sw" });
        private List<String> _instructions_type3 = new List<string>(new string[]
                            {"beq","bne" });
        private List<string> _registers = new List<string>(new string[] 
                            {"r0","r1","r2","r3","r4","r5","r6","r7" });

        private List<string> _labels = new List<string>();
        private List<int> _labels_mem = new List<int>();

        public Compilador_ASM()
        {

        }

        public void set_path(string path)
        {
            _path = path;
            Console.WriteLine(path);
        }

        public void lexico()
        {
            _error = "File Compiled!";
            _tokens.Clear();
            string[] lines = System.IO.File.ReadAllLines(@_path);
            for (int i =0; i < lines.Length; i++)
            {
                string[] tmp = lines[i].Split(new[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries);
               
                    List<string> tmp2= new List<string>();
                    for (int j =0; j<tmp.Length;j++)
                    {
                        if (tmp[j].StartsWith(";"))
                        {                        
                            break;
                        }
                        else
                        {
                            tmp2.Add(tmp[j]);
                        }
                    }
                    if (tmp2.Count == 0)
                    {

                    }
                    else
                    {
                        _tokens.Add(tmp2);
                    }      
            }
        }

        public void sintaxis()
        {
            for (int i = 0; i < _tokens.Count; i++)
            {
                if (_tokens[i][0].EndsWith(":"))
                {
                    _labels.Add(_tokens[i][0].Remove(':'));
                    _labels_mem.Add(_default_pc + i);
                }
                else if (_instructions_type1.Contains(_tokens[i][0])||_instructions_type2.Contains(_tokens[i][0])
                            ||_instructions_type3.Contains(_tokens[i][0]))
                {
                    if (_instructions_type1.Contains(_tokens[i][0]))
                    {
                        sintax_instruction_type1(_tokens[i]);
                    }
                    else if (_instructions_type2.Contains(_tokens[i][0]))
                    {
                        sintax_instruction_type2(_tokens[i]);
                    }
                    else
                    {

                    }
                }
                else
                {
                    _error = "Sintax Error: Instruction Not Found!";
                    break;
                }
            }
        }

        public bool sintax_instruction_type1(List<string> _instruction)
        {
            if (_instruction.Count != 4)
            {
                _error = "Sintax Error: Wrong Parameters!";
                return false;
            }
            else
            {
                if (_registers.Contains(_instruction[1].ToLower())&& _registers.Contains(_instruction[2].ToLower())
                    && _registers.Contains(_instruction[3].ToLower()))
                {
                    return true;
                }
                else
                {
                    _error = "Sintax Error: Wrong Registers";
                    return false;
                }
            }
        }

        public bool sintax_instruction_type2(List<string> _instruction)
        {
            
            if (_instruction.Count != 3)
            {
                _error = "Sintax Error: Wrong Parameters!";
                return false;
            }
            else
            {
                if (_registers.Contains(_instruction[1].ToLower()))
                {
                    int x;
                    if (_instruction[2].StartsWith("#")|| _instruction[2].StartsWith("0x")|| int.TryParse(_instruction[2], out x))
                    {
                        return true;
                    }
                    else
                    {
                        _error = "Sintax Error: Wrong Inmediate value!";
                        return false;
                    }
                }
                else
                {
                    _error = "Sintax Error: Wrong Registers";
                    return false;
                }
            }
        }

        public string get_msg()
        {
            return _error;
        }

        public void generate_hex_file()
        {
            string binpath = "D:\\program.bin";
            string[] bin = System.IO.File.ReadAllLines(binpath);
            int PC = 0;
            string lines = "";
            for(int i = 0; i < bin.Length; i++)
            {
                string tmp = ":04" + dec_to_hex(PC) + "00" + BinaryStringToHexString(bin[i]) + CalculateChecksum(BinaryStringToHexString(bin[i]));
                lines = lines + tmp + "\n";
                PC += 1;
            }
            lines = lines + ":00000001FF";
            System.IO.StreamWriter file = new System.IO.StreamWriter("D:\\test.hex");
            file.WriteLine(lines);

            file.Close();


        }
        public string BinaryStringToHexString(string binary)
        {
            StringBuilder result = new StringBuilder(binary.Length / 8 + 1);

            int mod4Len = binary.Length % 8;
            if (mod4Len != 0)
            {
                binary = binary.PadLeft(((binary.Length / 8) + 1) * 8, '0');
            }

            for (int i = 0; i < binary.Length; i += 8)
            {
                string eightBits = binary.Substring(i, 8);
                result.AppendFormat("{0:X2}", Convert.ToByte(eightBits, 2));
            }

            return result.ToString();
        }

        public string dec_to_hex(int dec)
        {
            string tmp = Convert.ToString(dec, 16);
            if (tmp.Length == 1)
            {
                tmp = "000" + tmp;
            }
            else if (tmp.Length == 2)
            {
                tmp = "00" + tmp;
            }
            else if (tmp.Length == 3)
            {
                tmp = "0" + tmp;
            }
            else
            {
                
            }
            return tmp.ToUpper();
        }

        public string CalculateChecksum(string data)
        {
            int checksum = 0;
            Console.WriteLine("Data: " + data);
            for (int i =0; i < (data.Length); i=i+2)
            {
                string tmp = data.Substring(i,2);
                
                int value= int.Parse(tmp, System.Globalization.NumberStyles.HexNumber);
                checksum += value;
                
           
            }
            int complemento = (int)Math.Pow(10, checksum.ToString().Length) - checksum;
            string check = dec_to_hex(complemento);
            return check.Substring(check.Length - 2);
        }

      

    }
}
