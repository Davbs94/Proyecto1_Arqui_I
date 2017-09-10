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
        }

        public void lexico()
        {
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
                        
                    }
                    else if (_instructions_type1.Contains(_tokens[i][0]))
                    {

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

        public bool Sintax_instruction_type1(List<string> _instruction)
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
    }
}
