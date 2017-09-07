using System;



    public class Compilador_ASM
    {
        private string _path;

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
            Console.WriteLine(lines[0]);
        }
    }

