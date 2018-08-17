

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls;

type
  Matrix = array[1..8] of array[1..8] of char;
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Image1: TImage;
    Image11: TImage;
    Image31: TImage;
    Image51: TImage;
    Image71: TImage;
    Image22: TImage;
    Image42: TImage;
    Image62: TImage;
    Image82: TImage;
    Image73: TImage;
    Image53: TImage;
    Image33: TImage;
    Image13: TImage;
    Image24: TImage;
    Image44: TImage;
    Image55: TImage;
    Image15: TImage;
    Image35: TImage;
    Image75: TImage;
    Image84: TImage;
    Image64: TImage;
    Image26: TImage;
    Image46: TImage;
    Image66: TImage;
    Image86: TImage;
    Image17: TImage;
    Image37: TImage;
    Image57: TImage;
    Image77: TImage;
    Image88: TImage;
    Image68: TImage;
    Image48: TImage;
    Image28: TImage;
    Timer1: TTimer;
    edt1: TEdit;
    Button1: TButton;
    edt2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt3: TEdit;
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image24Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image28Click(Sender: TObject);
    procedure Image31Click(Sender: TObject);
    procedure Image33Click(Sender: TObject);
    procedure Image35Click(Sender: TObject);
    procedure Image37Click(Sender: TObject);
    procedure Image42Click(Sender: TObject);
    procedure Image44Click(Sender: TObject);
    procedure Image46Click(Sender: TObject);
    procedure Image48Click(Sender: TObject);
    procedure Image51Click(Sender: TObject);
    procedure Image53Click(Sender: TObject);
    procedure Image55Click(Sender: TObject);
    procedure Image57Click(Sender: TObject);
    procedure Image62Click(Sender: TObject);
    procedure Image64Click(Sender: TObject);
    procedure Image66Click(Sender: TObject);
    procedure Image68Click(Sender: TObject);
    procedure Image71Click(Sender: TObject);
    procedure Image73Click(Sender: TObject);
    procedure Image75Click(Sender: TObject);
    procedure Image77Click(Sender: TObject);
    procedure Image82Click(Sender: TObject);
    procedure Image84Click(Sender: TObject);
    procedure Image86Click(Sender: TObject);
    procedure Image88Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  path:string;
  field,b:array[1..8,1..8] of Char;
  player,ka:Char;
  nowx,nowy,mustx,musty,xs,ys,pointb,pointw,needx,needy:Integer;
  x,y,x1,x2,y1,y2,prevx,prevy:Integer;
  cc,work,must,l1,l2,s1,win,w1,skip:Boolean;
implementation

uses Unit2;

{$R *.dfm}
// ��������� �������� �����. ����������� ����� � ������� ����� ���������
procedure dofield;
 var n,i,j:Integer;
  begin
  	for j:=1 to 8 do
    begin
	      for i:=1 to 3 do
      	if ((i+j) mod 2= 0) then Field[i,j]:='v';
        for i:=6 to 8 do
      	if ((i+j) mod 2= 0) then Field[i,j]:='d';
        for i:=4 to 5 do
      	if ((i+j) mod 2= 0) then Field[i,j]:='0';
    end;
    	
    	for i:=1 to 8 do
    	for j:=1 to 8 do
   begin
	  n:=i*10+j;
    		if field[i,j]='v' then
		    begin
     			with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
     			 begin
       				 Picture.LoadFromFile(path+'\pic\1.bmp');
           end;
   		   end;
    		if field[i,j]='d' then
		    begin
    			 with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      			begin
       				 Picture.LoadFromFile(path+'\pic\3.bmp');
      			end;
   		  end;
 	  end;
    end;

procedure checkwin;
begin
if (pointb=12) or (pointw=12) then win:=true;
end;

procedure testingqween;
var i,j,n:Integer;
begin
for i:=1 to 8 do
for j:=1 to 8 do
if ((i+j) mod 2 = 0) then field[i,j]:='0';

 field[1,1]:='w';
 field[2,2]:='b';
 field[2,4]:='b';
 field[7,7]:='b';
 field[8,8]:='b';





	for i:=1 to 8 do
    	for j:=1 to 8 do
   begin
	  n:=i*10+j;
    		if field[i,j]='w' then
		    begin
     			with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
     			 begin
       				 Picture.LoadFromFile(path+'\pic\0.bmp');
           end;
   		   end;
    		if field[i,j]='b' then
		    begin
    			 with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      			begin
       				 Picture.LoadFromFile(path+'\pic\2.bmp');
      			end;
   		  end;
        if field[i,j]='d' then
		    begin
    			 with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      			begin
       				 Picture.LoadFromFile(path+'\pic\3.bmp');
      			end;
   		  end;
        if field[i,j]='v' then
		    begin
    			 with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      			begin
       				 Picture.LoadFromFile(path+'\pic\1.bmp');
      			end;
   		  end;
 	  end;

end;

   // �������� �������� ���������� ����� �� ������ "����� ����"

   // ��������� �������� ���� �� ����� ����� ������ ������
procedure move(l:Char;x,y:Integer);
  var i,j,i1:Integer;
	way1,way2,way3,way4:boolean;
  u:char;
 begin
   if l='w' then u:='v';
   if l='b' then u:='d';
   if (field[x,y]=l) or (field[x,y]=u) then
   begin
  way1:=true;way2:=true;way3:=true;way4:=true;
   for i:=1 to 8 do
   for j:=1 to 8 do
   if ((i+j)mod 2 = 0) then
   b[i,j]:='0';

   if (field[x,y]='w') or (field[x,y]='b') then
	 begin
  	 	if l='w' then i1:=1;
  	 	if l='b' then i1:=-1;
 	 	i:=x; j:=y;

   			if ((i+i1)<9) and ((i+i1)>0) and ((j+1)<9)  then
  			if field[i+i1,j+1]='0' then b[i+i1,j+1]:='m';

  			if ((i+i1)<9) and ((i+i1)>0) and ((j-1)>0) then
  			if field[i+i1,j-1]='0' then b[i+i1,j-1]:='m';

   	end;
   if (field[x,y]='v') or (field[x,y]='d') then
   begin
	for i:=1 to 7 do begin
	if ((x+i)<9) and ((y+i)<9) and (way1) then
	begin
		if (field[x+i,y+i]='0') then b[x+i,y+i]:='m'
		else way1:=false;
	end;
	if ((x+i)<9) and ((y-i)>0) and (way2) then
	begin
		if (field[x+i,y-i]='0') then b[x+i,y-i]:='m'
		else way2:=false;
	end;
	if ((x-i)>0) and ((y+i)<9) and (way3) then
	begin
		if (field[x-i,y+i]='0') then b[x-i,y+i]:='m'
		else way3:=false;
	end;
	if ((x-i)>0) and ((y-i)>0) and (way4) then
	begin
		if (field[x-i,y-i]='0') then b[x-i,y-i]:='m'
		else way4:=false;
	end;
   end;
 end;
 end;
 end;


 // ���������, ������� ������ ��, ��� ������ move
procedure drawmove;
 var n,i,j:Integer;
 begin
 	 for i:=1 to 8 do
  	 for j:=1 to 8 do
		begin
     			n:=i*10+j;
    			if b[i,j]='m' then
			begin
  			 	with form1.FindComponent('Image' + IntToStr(n)) as TImage do
     			 	begin
       				 	Picture.LoadFromFile(path+'\pic\5.bmp');
      			 	end;
    			end;
    	 		 if not (b[i,j]='m') and (field[i,j]='0') and ((i+j) mod 2 = 0) then
			begin
   		 		with form1.FindComponent('Image' + IntToStr(n)) as TImage do
      				begin
        				Picture:=nil;
      				end;
 			end;
 		end;
end;

// ���������, ������� ������������, ���� �� ������ ����
procedure fight( l:Char);
 var i,j,i1,mx1,mx2,mx3,mx4,my1,my2,my3,my4:Integer;
 op1,op2,f:Char;
 way1,way2,way3,way4,k1,k2,k3,k4,g1,g2,g3,g4:boolean;
 begin
  if l='w' then
  begin
	op1:='b'; op2:='d'; f:='v';
  end;
  if l='b' then
  begin
	op1:='w'; op2:='v'; f:='d';
  end;

  for i:=1 to 8 do
  for j:=1 to 8 do
  begin
    if ((i+j)mod 2 =0) then
   	 b[i,j]:='0';
  end;

  
  for i:=1 to 8 do
  for j:=1 to 8 do
  begin
  	if (field[i,j]=l) and ((i+j)mod 2 = 0) then
 	 begin
		if (i+2<9) and (j+2<9) then
		if (field[i+1,j+1]=op1) or (field[i+1,j+1]=op2) then
      		if (field[i+2,j+2]='0') then

		begin
    
       	 		b[i+2,j+2]:='f';
			b[i+1,j+1]:='h';
      			b[i,j]:='s';
            must:=true;
        	end;

		if (i+2<9) and (j-2>0) then
		if (field[i+1,j-1]=op1) or (field[i+1,j-1]=op2) then
		if (field[i+2,j-2]='0') then
		begin
        		b[i+2,j-2]:='f';
			b[i+1,j-1]:='h';
      			b[i,j]:='s';
            must:=true;
       	 	end;

		if (i-2>0) and (j+2<9) then
		if (field[i-1,j+1]=op1) or (field[i-1,j+1]=op2) then
		if (field[i-2,j+2]='0') then
		begin
        		b[i-2,j+2]:='f';
			b[i-1,j+1]:='h';
      			b[i,j]:='s';
            must:=true;
        	end;

		if (i-2>0) and (j-2>0) then
		if (field[i-1,j-1]=op1) or (field[i-1,j-1]=op2) then
		if (field[i-2,j-2]='0') then
		begin
        		b[i-2,j-2]:='f';
			b[i-1,j-1]:='h';
      			b[i,j]:='s';
            must:=true;
        	end;
  	end;
  	if field[i,j]=f then
  	begin


		way1:=false;
		way2:=false;
		way3:=false;
		way4:=false;
		k1:=true;
		k2:=true;
		k3:=true;
		k4:=true;
    g1:=true;
    g2:=true;
    g3:=true;
    g4:=true;
		for i1:=1 to 7 do
		begin
			if ((i+i1)<9) and ((j+i1)<9) then
			begin
        if (way1) and not (field[i+i1,j+i1]='0') then way1:=false;
				if (g1) and (way1) and (field[i+i1,j+i1]='0') then
				begin
					b[i+i1,j+i1]:='f';
					b[i,j]:='s';
					b[mx1,my1]:='h';
          must:=true;
				end;
				if  (not (way1)) and (k1) and ((field[i+i1,j+i1]=op1) or (field[i+i1,j+i1]=op2)) then
				begin

 
					way1:=true;
					k1:=false;
					mx1:=i+i1;
					my1:=j+i1;
				end;
         if not (field[i+i1,j+i1]='0') and (not (way1)) and (k1) then g1:=False;

			end;

			if ((i+i1)<9) and ((j-i1)>0) then
			begin
        if (way2) and not (field[i+i1,j-i1]='0') then way2:=false;
				if (g2) and (way2) and (field[i+i1,j-i1]='0') then
				begin
					b[i+i1,j-i1]:='f';
					b[i,j]:='s';
					b[mx2,my2]:='h';
          must:=true;
				end;
				if not (way2) and (k2) and ((field[i+i1,j-i1]=op1) or (field[i+i1,j-i1]=op2)) then
				begin
					way2:=true;
					k2:=false;
					mx2:=i+i1;
					my2:=j-i1;
				end;
				if not (field[i+i1,j-i1]='0') and (not (way2)) and (k2) then g2:=False;
			end;

		if ((i-i1)>0) and ((j+i1)<9) then
			begin
        if (way3) and not (field[i-i1,j+i1]='0') then way3:=false;
				if (g3) and (way3) and (field[i-i1,j+i1]='0') then
				begin
					b[i-i1,j+i1]:='f';
					b[i,j]:='s';
					b[mx3,my3]:='h';
          must:=true;

				end;
				if not (way3) and (k3) and ((field[i-i1,j+i1]=op1) or (field[i-i1,j+i1]=op2)) then
				begin
					way3:=true;
					k3:=false;
					mx3:=i-i1;
					my3:=j+i1;
				end;
         if not (field[i-i1,j+i1]='0') and (not (way3)) and (k3) then g3:=False;
      end;

			if ((i-i1)>0) and ((j-i1)>0) then
			begin
        if (way4) and not (field[i-i1,j-i1]='0') then way4:=false;
				if (g4) and (way4) and (field[i-i1,j-i1]='0') then
				begin
					b[i-i1,j-i1]:='f';
					b[i,j]:='s';
					b[mx4,my4]:='h';
          must:=true;

				end;
				if not (way4) and (k4) and ((field[i-i1,j-i1]=op1) or (field[i-i1,j-i1]=op2)) then
				begin
					way4:=true;
					k4:=false;
					mx4:=i-i1;
					my4:=j-i1;
				end;
         if not (field[i-i1,j-i1]='0') and (not (way4)) and (k4) then g4:=False;
			end;
		end;
	end;
end;
end;

// ���������, ������� ������ ����� ��������� ����

procedure drawfight(x,y:integer);
 var n,i,j,i1:Integer;
 begin
 for i:=1 to 8 do
	 for j:=1 to 8 do
    if (b[i,j]='l') then b[i,j]:='f';
	 for i:=1 to 8 do
	 for j:=1 to 8 do
   begin;
	 if (b[x,y]='s') then
	 begin
		if (field[x,y]='b') or (field[x,y]='w') then
		begin
			if (b[x+2,y+2]='f') then b[x+2,y+2]:='l';
			if (b[x+2,y-2]='f') then b[x+2,y-2]:='l';
			if (b[x-2,y+2]='f') then b[x-2,y+2]:='l';
			if (b[x-2,y-2]='f') then b[x-2,y-2]:='l';
		end;
		if (field[x,y]='v') or (field[x,y]='d') then
		begin
			for i1:=1 to 7 do
			begin
				if (b[x+i,j+i1]='f') then b[x+i,j+i1]:='l';
				if (b[x+i,j-i1]='f') then b[x+i,j-i1]:='l';
				if (b[x-i,j+i1]='f') then b[x-i,j+i1]:='l';
				if (b[x-i,j-i1]='f') then b[x-i,j-i1]:='l';
			end;
		end;
	end;
  end;
	for i:=1 to 8 do
	for j:=1 to 8 do
	begin
		n:=i*10+j;
		if b[i,j]='l' then

		begin
  			 with form1.FindComponent('Image' + IntToStr(n)) as TImage do
     			 begin
       				Picture.LoadFromFile(path+'\pic\4.bmp');
      			 end;
    		end
		else if (field[i,j]='0') and ((i+j) mod 2 = 0) then
		begin
   		 	with form1.FindComponent('Image' + IntToStr(n)) as TImage do
      			begin
        			Picture:=nil;
      			end;
		end;
	end;
end;

// ��������� ���������, ���� �� ����� �������� ����

procedure Checker;
var x,y:Integer;
begin
  if (needx<>0) then begin
    x:=needx;
		y:=needy;
			prevx:=x;
			prevy:=y;
     needx:=0;
     needy:=0;
     cc:=true;
  end
  else
  if (work) then
  begin
		x:= nowx;
		y:=nowy;
		cc:=False;
		if (x<>prevx) or (y<>prevy) then
     begin
			prevx:=x;
			prevy:=y;
			cc:=True;
     end;
   end;
   work:=True;
end;

//��������� ��������� ���, �� �� �������

procedure movedo (x1,y1,x2,y2:Integer);
var g:Char; n,m:Integer;
begin
	g:=field[x1,y1];
	n:=x2*10+y2;
	m:=x1*10+y1;
	if g='b' then
	begin
		field[x1,y1]:='0';
		field[x2,y2]:=g;
		with Form1.FindComponent('Image' + IntToStr(m)) as TImage do
      		begin
        		Picture:=nil;
     		end;
      		with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      		begin
        		Picture.LoadFromFile(path+'\pic\2.bmp');
      		end;
	end;
	if g='w' then
	begin
		field[x1,y1]:='0';
		field[x2,y2]:=g;
		with Form1.FindComponent('Image' + IntToStr(m)) as TImage do
      		begin
        		Picture:=nil;
     		end;
      		with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      		begin
        		Picture.LoadFromFile(path+'\pic\0.bmp');
      		end;
	end;
	if g='v' then
	begin
		field[x1,y1]:='0';
		field[x2,y2]:=g;
		with Form1.FindComponent('Image' + IntToStr(m)) as TImage do
      		begin
        		Picture:=nil;
     		end;
      		with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      		begin
        		Picture.LoadFromFile(path+'\pic\1.bmp');
      		end;
	end;
	if g='d' then
	begin
		field[x1,y1]:='0';
		field[x2,y2]:=g;
		with Form1.FindComponent('Image' + IntToStr(m)) as TImage do
      		begin
        		Picture:=nil;
     		end;
      		with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      		begin
       	 		Picture.LoadFromFile(path+'\pic\3.bmp');
      		end;
	end;
end;

// ��������� ���������� ������ ����� � �����

procedure qween;
var i,j:Integer;
begin
for j:=1 to 8 do
begin
  if (field[1,j]='b') then
  begin
  field[1,j]:='d';
  with Form1.FindComponent('Image' + IntToStr(10+j)) as TImage do
      		begin
       	 		Picture.LoadFromFile(path+'\pic\3.bmp');
      		end;
  end;
  if (field[8,j]='w') then
  begin
  field[8,j]:='v';
  with Form1.FindComponent('Image' + IntToStr(80+j)) as TImage do
      		begin
       	 		Picture.LoadFromFile(path+'\pic\1.bmp');
      		end;
  end;
end;
end;


//��������� ������ ������� ���

procedure movehitdo (x1,y1,x2,y2:Integer);
var i,j,n,m:integer;
    way1,way2,way3,way4:boolean;
begin
	movedo(x1,y1,x2,y2);
	way1:=false;
	way2:=false;
	way3:=false;
	way4:=false;
	if (x2>x1) and (y2>y1) then way1:=true;
	if (x2>x1) and (y2<y1) then way2:=true;
	if (x2<x1) and (y2>y1) then way3:=true;
	if (x2<x1) and (y2<y1) then way4:=true;
	if (way1) then 
	begin
		for i:=x1 to x2 do
		for j:=y1 to y2 do
    if ((j+i) mod 2 = 0) then
    if (b[i,j]='h') then
		begin
			field[i,j]:='0';
			with Form1.FindComponent('Image' + IntToStr(10*i+j)) as TImage do
      			begin
       	 			Picture:=nil;
      			end;
		end;
	end;
	if (way2) then
	begin
		for i:=x1 to x2 do
		for j:=y1 downto y2 do
     if ((j+i) mod 2 = 0) then
     if (b[i,j]='h') then
		begin
			field[i,j]:='0';
			with Form1.FindComponent('Image' + IntToStr(10*i+j)) as TImage do
      			begin
       	 			Picture:=nil;
      			end;
		end;
	end;
	if (way3) then 
	begin
		for i:=x1 downto x2 do
		for j:=y1 to y2 do
     if ((j+i) mod 2 = 0) then
     if (b[i,j]='h') then
		begin
			field[i,j]:='0';
			with Form1.FindComponent('Image' + IntToStr(10*i+j)) as TImage do
      			begin
       	 			Picture:=nil;
      			end;
		end;
	end;
	if (way4) then 
	begin
		for i:=x1 downto x2 do
		for j:=y1 downto y2 do
     if ((j+i) mod 2 = 0) then
     if (b[i,j]='h') then
		begin
			field[i,j]:='0';
			with Form1.FindComponent('Image' + IntToStr(10*i+j)) as TImage do
      			begin
       	 			Picture:=nil;
      			end;
		end;
	end;
	for i:=1 to 8 do 
	for j:=1 to 8 do
	begin
		if (field[i,j]='0') and ((i+j) mod 2 = 0) then
		with Form1.FindComponent('Image' + IntToStr(10*i+j)) as TImage do
      		begin
       	 		Picture:=nil;
      		end;
	end;
end;

//  ��������� ������� ����� �� ������ �������
procedure clean;
var i,j,n:Integer;
begin
for i:=1 to 8 do
for j:=1 to 8 do
begin
n:=i*10+j;
if (field[i,j]='0') and ((i+j) mod 2 = 0) then
	with Form1.FindComponent('Image' + IntToStr(n)) as TImage do
      		begin
       	 		Picture:=nil;
      		end;
end;
end;

procedure count;
begin
Form1.edt1.Text:=IntToStr(pointw);
Form1.edt2.Text:=IntToStr(pointb);
end;


//�������� ���������

procedure Main;
var olo:Char;
i,j:Integer;
m:Boolean;

begin
qween;
checkwin;
if win then
begin
if (pointb=12) and (w1) then ShowMessage('Black player won!');
if (pointw=12) and (w1) then ShowMessage('White player won!');
w1:=False;
pointw:=0;
pointb:=0;
Form1.Timer1.Enabled:=False;
end
else
if not (ka='0') then
begin
  if ka='w' then
  begin
    if not (skip) then
    begin
      skip:=True;
    end;
    x1:=nowx;
    y1:=nowy;
    Form1.edt3.Text:='o';







end;
 end

 else
	case Player of
	'w':
	begin
		Checker;
    work:=True;
	 	if (cc) then
    begin

    if (l1) then
		fight('w');
		if (must) then
		begin
      if (x1=0) then
      begin
      x1:=nowx;
      y1:=nowy;

      if (b[x1,y1]='s')  then
      begin
			drawfight(x1,y1);
      s1:=True;
      end
      else
      begin
      x1:=0;
      y1:=0;
      clean;
      end;
      end
      else
      begin
			if (s1) then
			begin
        drawfight(x1,y1);
        x2:=nowx;
        y2:=nowy;
				if (b[x2,y2]='l') then
				begin
				movehitdo(x1,y1,x2,y2);
				pointw:=pointw+1;
        m:=False;
        must:=False;
        fight('w');
        drawfight(x2,y2);
       { for i:=1 to 8 do
        for j:=1 to 8 do    }
        if (b[x2,y2]='s') then m:=True;
                                             m:=False;
        if (m) then
        begin
      {  drawfight(x2,y2); }
        ka:='w';

        y1:=0;
				x1:=0;
			{	x2:=0;
				y2:=0; }
        must:=false;
        l1:=True;
        s1:=false;
        clean;
        count;

         {Form1.edt3.Text:='gogog';   }
        m:= False;
        end
        else
        begin
				y1:=0;
				x1:=0;
				x2:=0;
				y2:=0;
        must:=false;
				Player:='b';
        l1:=True;
        s1:=false;
        clean;
        count;
        skip:=False;
        end;
			end
      else
       begin
        needy:=y2;
        needx:=x2;
        if (b[x2,y2]='s')  then
        begin


		  	drawfight(x2,y2);

        s1:=True;
        end;
        x1:=0;
        x2:=0;
        y1:=0;
        y2:=0;

    {    clean;    }
       end;
      end;
      end;
      end
		else
		begin
      l1:=False;
     if (x1=0) then
      begin
       x1:=nowx;
       y1:=nowy;
			move('w',x1,y1);
			drawmove;

      end
			else
			begin
       x2:=nowx;
       y2:=nowy;
        olo:=b[x2,y2];
				if (olo='m') then
        begin
         movedo(x1,y1,x2,y2);
         x1:=0;
         x2:=0;
         y1:=0;
         y2:=0;
         Player:='b';
         l1:=True;
         clean;
        end;
        if not (olo='m') then
        begin
        needy:=y2;
        needx:=x2;
        move('w',x1,y1);
		   	drawmove;
        x1:=0;
        x2:=0;
        y1:=0;
        y2:=0;
        clean;
        work:=False;
        move('w',x1,y1);
		   	drawmove;
        l1:=true;

         end;
      end;
		end;
	end;
  end;
	'b':
	begin
		Checker;
    work:=True;
	 	if (cc) then
    begin

    if (l1) then
		fight('b');
		if (must) then
		begin
      if (x1=0) then
      begin
      x1:=nowx;
      y1:=nowy;

      if (b[x1,y1]='s')  then
      begin
			drawfight(x1,y1);
      s1:=True;
      end
      else
      begin
      x1:=0;
      y1:=0;
      clean;
      end;
      end
      else
      begin
			if (s1) then
			begin
        drawfight(x1,y1);
        x2:=nowx;
        y2:=nowy;
				if (b[x2,y2]='l') then
				begin
				movehitdo(x1,y1,x2,y2);
				pointb:=pointb+1;
				y1:=0;
				x1:=0;
				x2:=0;
				y2:=0;
        must:=false;
				Player:='w';
        l1:=True;
        s1:=false;
        clean;
        count;
			end
      else
       begin
       needy:=y2;
        needx:=x2;
        if (b[x2,y2]='s')  then
        begin
        drawfight(x2,y2);
        s1:=True;
        end;
        x1:=0;
        x2:=0;
        y1:=0;
        y2:=0;
       end;
      end;
      end;
      end
		else
		begin
      l1:=False;
     if (x1=0) then
      begin
       x1:=nowx;
       y1:=nowy;
			move('b',x1,y1);
			drawmove;

      end
			else
			begin
       x2:=nowx;
       y2:=nowy;
        olo:=b[x2,y2];
				if (olo='m') then
        begin
         movedo(x1,y1,x2,y2);
         x1:=0;
         x2:=0;
         y1:=0;
         y2:=0;
         Player:='w';
         l1:=True;
         clean;
        end;
        if not (olo='m') then
        begin
        needy:=y2;
        needx:=x2;
        move('w',x1,y1);
		   	drawmove;
        x1:=0;
        x2:=0;
        y1:=0;
        y2:=0;
        clean;
        work:=False;
        move('b',x1,y1);
		   	drawmove;
        l1:=true;

         end;
      end;
		end;
	end;
  end;
	end;
end;





procedure TForm1.N6Click(Sender: TObject);
begin
   if (not Assigned(Form2)) then   // �������� ������� ����
       Form2:=TForm2.Create(Self);
   Form2.Show; // ( Form2.ShowModal)


end;

procedure TForm1.N4Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin

{testingqween;}
dofield;     
clean;
Player:='w'  ;
pointw:=0;
pointb:=0;
w1:=true;
must:=False;
work:=True;
x1:=0;
y1:=0;
x2:=0;
y2:=0;
 l1:=True;
 l2:=True;
 count;
 ka:='0';
Timer1.Enabled:=True;


end;

procedure TForm1.Image11Click(Sender: TObject);
begin
  nowx:=1;
  nowy:=1;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
var x,y:Integer;
begin

Main;





end;







procedure TForm1.Image22Click(Sender: TObject);
begin
nowx:=2;
nowy:=2;
end;

procedure TForm1.Image13Click(Sender: TObject);
begin
nowx:=1;
nowy:=3;
end;

procedure TForm1.Image15Click(Sender: TObject);
begin
nowx:=1;
nowy:=5;
end;

procedure TForm1.Image17Click(Sender: TObject);
begin
nowx:=1;
nowy:=7;
end;

procedure TForm1.Image24Click(Sender: TObject);
begin
nowx:=2;
nowy:=4;
end;

procedure TForm1.Image26Click(Sender: TObject);
begin
nowx:=2;
nowy:=6;
end;

procedure TForm1.Image28Click(Sender: TObject);
begin
nowx:=2;
nowy:=8;
end;

procedure TForm1.Image31Click(Sender: TObject);
begin
nowx:=3;
nowy:=1;
end;

procedure TForm1.Image33Click(Sender: TObject);
begin
nowx:=3;
nowy:=3;
end;

procedure TForm1.Image35Click(Sender: TObject);
begin
nowx:=3;
nowy:=5;
end;

procedure TForm1.Image37Click(Sender: TObject);
begin
nowx:=3;
nowy:=7;
end;

procedure TForm1.Image42Click(Sender: TObject);
begin
nowx:=4;
nowy:=2;
end;

procedure TForm1.Image44Click(Sender: TObject);
begin
nowx:=4;
nowy:=4;
end;

procedure TForm1.Image46Click(Sender: TObject);
begin
nowx:=4;
nowy:=6;
end;

procedure TForm1.Image48Click(Sender: TObject);
begin
nowx:=4;
nowy:=8;
end;

procedure TForm1.Image51Click(Sender: TObject);
begin
nowx:=5;
nowy:=1;
end;

procedure TForm1.Image53Click(Sender: TObject);
begin
nowx:=5;
nowy:=3;
end;

procedure TForm1.Image55Click(Sender: TObject);
begin
nowx:=5;
nowy:=5;
end;

procedure TForm1.Image57Click(Sender: TObject);
begin
nowx:=5;
nowy:=7;
end;

procedure TForm1.Image62Click(Sender: TObject);
begin
nowx:=6;
nowy:=2;
end;

procedure TForm1.Image64Click(Sender: TObject);
begin
nowx:=6;
nowy:=4;
end;

procedure TForm1.Image66Click(Sender: TObject);
begin
nowx:=6;
nowy:=6;
end;

procedure TForm1.Image68Click(Sender: TObject);
begin
nowx:=6;
nowy:=8;
end;

procedure TForm1.Image71Click(Sender: TObject);
begin
nowx:=7;
nowy:=1;
end;

procedure TForm1.Image73Click(Sender: TObject);
begin
nowx:=7;
nowy:=3;
end;

procedure TForm1.Image75Click(Sender: TObject);
begin
nowx:=7;
nowy:=5;
end;

procedure TForm1.Image77Click(Sender: TObject);
begin
nowx:=7;
nowy:=7;
end;

procedure TForm1.Image82Click(Sender: TObject);
begin
nowx:=8;
nowy:=2;
end;

procedure TForm1.Image84Click(Sender: TObject);
begin
nowx:=8;
nowy:=4;
end;

procedure TForm1.Image86Click(Sender: TObject);
begin
nowx:=8;
nowy:=6;
end;

procedure TForm1.Image88Click(Sender: TObject);
begin
nowx:=8;
nowy:=8;
end;


procedure TForm1.Button1Click(Sender: TObject);
var olo:Char;
begin
{pointw:=12;}
 Form1.edt3.Text:=b[3,3];

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
path:=ExtractFileDir(Application.ExeName);
end;

end.

