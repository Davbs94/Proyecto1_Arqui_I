`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:58 06/17/2017 
// Design Name: 
// Module Name:    motherboard 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module motherboard(input clk, input reset,output  [31:0] pc, output [31:0] read_data, output [31:0] result);
	 
	 
	 
//Wires principales
wire clk,reset;

//wires FSM Control
wire PC_LD,SEL_DIR,MEN_WD,MEM_RD,IR_W,SEL_DEST,SEL_DAT,REG_RD,REG_WR,SEL_OPERAB,OP_ALU;
wire [1:0] SEL_OPERA,SEL_PC;
wire [5:0] OPCODE;



//wires registro pc
wire [31:0] newpc;	

//wires memoria principal
wire [31:0]  write_data,read_data;

//wires mux dir
wire [31:0] dir,b,c1,d1;

//wire registro de instrccion
wire [31:0] instrucc;

//wire banco de registros
wire [5:0] dirb;
wire [31:0] wrbr,data_A,data_B;

//Wire registro de salida banco de registros
wire [31:0] data_OA,data_OB;

//wires mux exe
wire [31:0] b2,b3,opera,operb;

//wire control alu
wire [3:0] ALU_FUN;

//wire ALU
wire [31:0] result;

//wire mux sel_dat
wire [31:0] b4;

//wire mux pc
wire [31:0] pc4,b5,c5,d5;

//wire calculador de jumps
wire [31:0] newjump;



///////////////////////////////////////////////////////////////////////////////////////////////
//Memoria Principal-- Contiene Datos estaticos, Texto de programa, registros reservados
Memoria  MainMemory(dir,write_data,MEM_WD,MEM_RD,clk,read_data);
///////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Componentes del procesador

//Maquina de estados de control
Control  fsmcontrol(clk,reset,read_data[31:26],PC_LD, SEL_DIR, MEM_WD, MEM_RD,
							IR_W,SEL_DEST,SEL_DAT,REG_RD,REG_WR,
							SEL_OPERA,SEL_OPERAB,SEL_PC,OP_ALU);

				
//Registro de PC							
PCReg registropc(newpc,PC_LD,pc,clk);


//Mux Direcciones de memoria principal
mux2 mux_pc(SEL_DIR,pc,b,dir);



//registro de instrccuion
Registro_instruc regInstruccion(read_data,IR_W,instrucc,clk);


//Mux escritura decode
mux2 mux_dest(SEL_DEST,instrucc[20:16],instrucc[15:11],dirb);

//Banco de registros
MemoriaDeco bancoRegistros(instrucc[25:21],instrucc[20:16],dirb,wrbr,REG_WR,REG_RD,clk,data_A,data_B);



//registro de salida A de banco de registros
MemoriaReg reg_A(data_A,data_OA,clk);

//registro de salida B de banco de registros
MemoriaReg reg_B(data_B,data_OB,clk);


//Mux Direcciones de memoria principal
mux2 mux_opera(SEL_OPERA,data_OA,b2,opera);
//Mux Direcciones de memoria principal
mux2 mux_operb(SEL_OPERAB,data_OB,{16'h0000,instrucc[15:0]},operb);


//ALU control
ControlAlu contralu(instrucc[5:0],instrucc[31:26],OP_ALU,ALU_FUN);

//ALU
alu alu_simple(opera,operb,ALU_FUN,0,0,result);

//registro de salida del ALU
MemoriaReg reg_result(result,resultO,clk);


//Mux SEL_DAT de escritura en el banco de registros
mux2 mux_seldat(SEL_DAT,result,b4,wrbr);


//mux de seleccion de pc
mux4  muxpc(SEL_PC, pc4, newjump, c5, d5, newpc);

//sumador de 4 para el pc
sumador4 sum4(pc,pc4);


//Calculador de saltos "jumps"
jumpcalculation  jumps(pc, instrucc[25:0], newjump);
///////////////////////////////////////////////////////////////////////////////////////////////
endmodule
