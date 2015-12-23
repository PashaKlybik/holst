unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Math;

type
  TMetrika = class(TForm)
    Clean_But: TButton;

    Analyze_But: TButton;
    Memo_inputFile: TMemo;
    MemoFunctionNames: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure MemoClear(Memo: TMemo);
    procedure Clean_ButClick(Sender: TObject);
    function Research_Operators(Memo: TMemo; operatorsAllCount : Integer) : Integer;
    function Operands_Search(Memo: TMemo; operandsAllCount : Integer) : Integer;
    procedure Analyze_ButClick(Sender: TObject);
  public
    { Public declarations }
  end;
const
  signEmpty = '';
  signSpace = ' ';


  operatorWordCount = 9;
  ArrayOperatorWord : array [1..operatorWordCount] of String = ('break','catch','for','if','new','return','switch','try','while');

  operatorNotNameOfFunctionCount = 6;
  ArrayOperatorNotNameOfFunction : array [1..operatorNotNameOfFunctionCount] of String = ('while','for','if','switch','catch','try');

  accessPropertyCount = 3;
  ArrayAccessProperty : array [1..accessPropertyCount] of String = ('public','private','protected');

  findElementsCount = 1000;
  operationSignsCount = 34;
  ArrayOperationSigns : array [1..operationSignsCount] of String = ('=','+','-','*','/','%','+=','-=','*=','/=','%=',
                                                                      '!=','<','<=','>','>=','||','&&','!','~','&','&=','|','|=',
                                                                      '^','^=','>>','>>=','<<','<<=','>>>','>>>=','?',':');
  operatorNotWordCount = 46;
  ArrayOperatorNotWord : array [1..operatorNotWordCount] of String = ('+','-','*','/','%','++','--','=','+=','-=','*=','/=','%=',
                                                                        '==','!=','<','<=','>','>=','||','&&','!','~','&','&=',
                                                                        '|','|=','^','^=','>>','>>=','<<','<<=','>>>','>>>=','(',')',
                                                                        '[',']','{','}',';',',','.','?',':');

var
  Metrika: TMetrika;
  ArrayParticularOperators : array[1..findElementsCount] of String;
  ArrayParticularOperands : array[1..findElementsCount] of String;
  ArrayAllOperands : array[1..findElementsCount] of String;
  ArrayAllOperators : array[1..findElementsCount] of String;

  all_text: string;
  all_tokens: array[1..500] of string;

implementation
uses Unit1;
{$R *.dfm}

procedure TMetrika.FormCreate(Sender: TObject);
begin
  Memo_inputFile.Lines.Clear;
  Memo_inputFile.Lines.LoadFromFile('input.java');
  Analyze_But.Enabled := False;
end;


procedure TMetrika.MemoClear(Memo: TMemo);
const
  signTab = #9;
  signSlash = '/';
  signStar = '*';
var
  i, j, k, h, spaceCount, commentLinesCount, nextCommentLineNumber : Integer;
  PropertyString, temporaryString : String;

begin
  PropertyString := signEmpty;
  spaceCount := 0;
  for i := 0 to Memo.Lines.Count-1 do
  begin
    PropertyString := Memo.Lines[i];
    for j := 1 to length(PropertyString) do
      if PropertyString[j] = signSpace then inc(spaceCount);
    if spaceCount = length(PropertyString) then Memo.Lines.Delete(i)
    else
      Memo.Lines[i] := PropertyString;
    PropertyString := signEmpty;
    spaceCount := 0;
  end;

  PropertyString := signEmpty;
  for i := 0 to Memo.Lines.Count-1 do
  begin
    PropertyString := Memo.Lines[i];
    j := 1;
    while j <= length(PropertyString) do
    begin
      if PropertyString[j] = signTab then
      begin
        Delete(PropertyString,j,1);
        dec(j);
      end;
      inc(j);
    end;
    Memo.Lines[i] := PropertyString;
    PropertyString := signEmpty;
  end;

  PropertyString := signEmpty;
  for i := 0 to Memo.Lines.Count-1 do
  begin
    PropertyString := Memo.Lines[i];
    j := 1;
    while PropertyString[j] = signSpace do
      inc(j);
    Delete(PropertyString,1,j-1);
    Memo.Lines[i] := PropertyString;
    PropertyString := signEmpty;
  end;

  PropertyString := signEmpty;
  for i := 0 to Memo.Lines.Count-1 do
  begin
    PropertyString := Memo.Lines[i];
    for j := 1 to length(PropertyString) do
      if (PropertyString[j] = signSlash) and (PropertyString[j+1] = signSlash) then
        if j = 1 then Memo.Lines.Delete(i)
        else
        begin
          Delete(PropertyString,j,length(PropertyString)-j+1);
          Memo.Lines[i] := PropertyString;
        end;
    PropertyString := signEmpty;
  end;

  PropertyString := signEmpty;
  for i := 0 to Memo.Lines.Count-1 do
  begin
    h := 0;
    commentLinesCount := 0;
    PropertyString := Memo.Lines[i];
    for j := 1 to length(PropertyString) do
      if (PropertyString[j] = signStar) and (PropertyString[j+1] = signSlash) then
      begin
        if j = 1 then Memo.Lines.Delete(i)
        else
        begin
          Delete(PropertyString,j,length(PropertyString)-j+1);
          Memo.Lines[i] := PropertyString;
          h := 1;
        end;
        commentLinesCount := 1;
        break;
      end;

    k := 0;
    if commentLinesCount = 1 then
    begin
      for nextCommentLineNumber := i to Memo.Lines.Count-1 do
      begin
        temporaryString := Memo.Lines[k];
        for j := 1 to length(temporaryString) do
          if (temporaryString[j] = signStar) and (temporaryString[j+1] = signSlash) then
          begin
            k := nextCommentLineNumber;
            break;
          end;
        if k <> 0 then break;
      end;
    end;

    if k <> 0 then
    begin
        if h = 0 then
          for j := k downto i do
            Memo.Lines.Delete(j);
        if h = 1 then
          for j := k downto i+1 do
            Memo.Lines.Delete(j);
    end;
    PropertyString := signEmpty;
  end;
end;


procedure TMetrika.Clean_ButClick(Sender: TObject);
var
  Memo: TMemo;
  i,j,k,n, mesto, h , count:integer;
  ch: char;
  temp: integer;
  tempstr,PropertyString,TempString,NameOfFunction: string;
begin
  Memo := Memo_inputFile;
  MemoClear(Memo);
  Analyze_But.Enabled := True;
  Clean_But.Enabled := False;
  for i := 0 to Memo.Lines.Count - 1 do
  begin
    Count := 0;
    NameOfFunction := '';
    PropertyString := Memo.Lines[i];
    for j := 1 to length(PropertyString) do
      if PropertyString[j] = signSpace then
        break;
    TempString := Copy(PropertyString, 1, j - 1);
    if (TempString = 'public') or (TempString = 'private') then
    begin
      for k := j + 1 to length(PropertyString) do
      begin
        if PropertyString[k] = '(' then
          for h := k downto 1 do
            if PropertyString[h] = ' ' then
              break;
      end;
      NameOfFunction := Copy(PropertyString, h + 1, k - h - 1);
    end;
    if NameOfFunction <> '' then
      MemoFunctionNames.Lines.Add(NameOfFunction);
    NameOfFunction := '';
  end;
end;


function TMetrika.Research_Operators(Memo: TMemo; operatorsAllCount : Integer) : Integer;
const
  digitTwo = 2;
  signOpenBracket = '(';
  signCloseBracket = ')';
  signPoint = '.';
  signComma = ',';
var
  i, j, k, operatorsCount : Integer;
  analyzeString, nameFunction, accessString : String;
  isAccess, isChangeOperatorsCount : Boolean;

begin
  analyzeString := signEmpty;
  operatorsCount := 0;

  for i := 0 to Memo.Lines.Count-1 do
  begin
    analyzeString := Memo.Lines[i];

    for j := 1 to operatorWordCount do
      if Pos(arrayOperatorWord[j],analyzeString) <> 0 then
      begin
        inc(operatorsCount);
        ArrayAllOperators[operatorsAllCount] := arrayOperatorWord[j];
        inc(operatorsAllCount);
      end;

    for j := 1 to length(analyzeString) do
      for k := 1 to operatorNotWordCount do
        if analyzeString[j] = ArrayOperatorNotWord[k] then
        begin
          inc(operatorsCount);
          ArrayAllOperators[operatorsAllCount] := ArrayOperatorNotWord[k];
          inc(operatorsAllCount);
        end;
  end;

  analyzeString := signEmpty;
  for i := 0 to Memo.Lines.Count-1 do
  begin
    analyzeString := Memo.Lines[i];
    isAccess := true;
    for j := 1 to length(analyzeString) do
      if analyzeString[j] = signSpace then break;

    accessString := copy(analyzeString,1,j-1);
    for j := 1 to accessPropertyCount do
      if accessString = ArrayAccessProperty[j] then isAccess := false;
    if isAccess = false then continue;

    for j := 1 to length(analyzeString) do
    begin
      if analyzeString[j] = signOpenBracket then
      begin
        for k := j downto 1 do
          if (analyzeString[k] = signPoint) or (analyzeString[k] = signSpace) then break;

        for k := j-digitTwo downto 1 do
          if analyzeString[k] = signSpace then break;
        nameFunction := copy(analyzeString,k+1,j-k-1);
        inc(operatorsCount);
        isChangeOperatorsCount := false;

        for k := 1 to operatorNotNameOfFunctionCount do
          if nameFunction = ArrayOperatorNotNameOfFunction[k] then
          begin
            dec(operatorsCount);
            isChangeOperatorsCount := true;
          end;

        if isChangeOperatorsCount = false then
        begin
          ArrayAllOperators[operatorsAllCount] := nameFunction;
          inc(operatorsAllCount);
        end;
        nameFunction := signEmpty;
      end;
    end;
  end;

  Result := operatorsCount;
end;


function TMetrika.Operands_Search(Memo: TMemo; operandsAllCount : Integer) : Integer;
const
  operatorNew = 'new';
  operatorDouble = 3;
  operatorSingle = 2;
  operationEqual = '=';
  operationPlus = '+';
  operationMinus = '-';
  signOpenBracket = '(';
  signCloseBracket = ')';
  signPoint = '.';
  signComma = ',';
var
  i, j, k, h, operandsCount, lineOperationCount, lineBracketCount, lineArgumentsCount, operatorType: Integer;
  analyzeString, accessString, temporaryOperandLeft, temporaryOperandRight, temporaryFunctionInBrackets, temporaryArgument: String;
  isAccess : Boolean;

begin
  analyzeString := signEmpty;
  operandsCount := 0;

  for i := 0 to Memo.Lines.Count-1 do
  begin
    analyzeString := Memo.Lines[i];
    lineOperationCount := 0;

    for j := 1 to operationSignsCount do
      if Pos(ArrayOperationSigns[j],analyzeString) <> 0 then
      begin
        inc(lineOperationCount);
        k := Pos(ArrayOperationSigns[j],analyzeString);
        operatorType := operatorSingle;
        if (analyzeString[k+1] = operationEqual) or (analyzeString[k+1] = operationPlus) or (analyzeString[k+1] = operationMinus) then
          operatorType := operatorDouble;

        if lineOperationCount = 1 then
        begin
          for h := k-operatorSingle downto 1 do
            if (analyzeString[h] = signSpace) or (analyzeString[h] = signOpenBracket) then break;
          temporaryOperandLeft := copy(analyzeString,h+1,k-h-1);
          if temporaryOperandLeft <> signEmpty then
          begin
            inc(operandsCount);
            ArrayAllOperands[operandsAllCount] := temporaryOperandLeft;
            inc(operandsAllCount);
          end;
        end;

        for h := k+operatorType to length(analyzeString)-1 do
          if (analyzeString[h] = signSpace) or (analyzeString[h] = signOpenBracket) or (analyzeString[h] = signCloseBracket) then break;
        temporaryOperandRight := copy(analyzeString,k+operatorType,h-k-operatorType);
        if temporaryOperandRight <> signEmpty then
        begin
            inc(operandsCount);
            if temporaryOperandRight = operatorNew then dec(operandsCount)
            else
            begin
              ArrayAllOperands[operandsAllCount] := temporaryOperandRight;
              inc(operandsAllCount);
            end;
        end;
      end;
  end;

  analyzeString := signEmpty;
  for i := 0 to Memo.Lines.Count-1 do
  begin
    analyzeString := Memo.Lines[i];

    isAccess := true;
    for j := 1 to length(analyzeString) do
      if analyzeString[j] = signSpace then break;
    accessString := copy(analyzeString,1,j-1);
    for j := 1 to accessPropertyCount do
      if accessString = ArrayAccessProperty[j] then isAccess := false;
    if isAccess = false then continue;
    if accessString = ArrayOperatorNotNameOfFunction[operatorDouble] then continue;

    if Pos(signOpenBracket,analyzeString) <> 0 then
    begin
      for k := 1 to length(analyzeString) do
        if analyzeString[k] = signOpenBracket then break;
      lineBracketCount := 1;

      for h := k to length(analyzeString) do
      begin
        if analyzeString[h] = signOpenBracket then inc(lineBracketCount);
        if analyzeString[h] = signCloseBracket then dec(lineBracketCount);
        if lineBracketCount = 0 then break;
      end;
      temporaryFunctionInBrackets := copy(analyzeString,k+1,h-k-operatorDouble);

      lineArgumentsCount := 1;
      for j := 1 to length(temporaryFunctionInBrackets) do
        if temporaryFunctionInBrackets[j] = signComma then inc(lineArgumentsCount);

      for j := 1 to lineArgumentsCount do
      begin
        for h := 1 to length(temporaryFunctionInBrackets) do
          if temporaryFunctionInBrackets[h] = signComma then break;

        temporaryArgument := copy(temporaryFunctionInBrackets,1,h-1);
        Delete(temporaryFunctionInBrackets,1,h+1);

        for h := 1 to length(temporaryArgument) do
          if temporaryArgument[h] = signPoint then Delete(temporaryArgument,1,h);
        for h := 1 to length(temporaryArgument) do
          if temporaryArgument[h] = signOpenBracket then Delete(temporaryArgument,h,length(temporaryArgument)-h+1);
        for h := 1 to length(temporaryArgument) do
          if temporaryArgument[h] = signSpace then Delete(temporaryArgument,1,h);

        if temporaryArgument <> signEmpty then
        begin
          inc(operandsCount);
          ArrayAllOperands[operandsAllCount] := temporaryArgument;
          inc(operandsAllCount);
        end;
      end;
    end;
  end;

  Result := operandsCount;
end;


procedure TMetrika.Analyze_ButClick(Sender: TObject);
const
  digitTwo = 2;
  digitThree = 3;
var
  Memo: TMemo;
  operatorsCount, operatorsAllCount, operandsCount, operandsAllCount : Integer;
  i, j, operatorsInMassiveCount, operatorsInUniqueMassiveCount, operandsInMassiveCount, operandsInUniqueMassiveCount : Integer;
  lengthOfProgram, dictionaryOfProgram : Integer;
  volumeOfProgram, teoreticLengthOfProgram, levelQualityOfProgram, teoreticVolumeOfProgram, complexityUnderstandingOfProgram : Extended;
  complexityOfCoding, informationContentOfProgram, intellectualEffortsOfProgram, temporaryRoundResultValue : Extended;
  analyzeString : String;
  n: integer;
begin
 FormOutput.Output.cells[0,0]:= '������������� ����� ��������� (N)';
 FormOutput.Output.cells[0,1]:= '������� �������� ���������������� (L)';
 FormOutput.Output.cells[0,2]:= '������������� ����� ��������� (V)';
 FormOutput.Output.cells[0,3]:= '��������� ��������� ��������� (Ec)';
 FormOutput.Output.cells[0,4]:= '������������ ����������� ��������� (D)';
 FormOutput.Output.cells[0,5]:= '�������������� ���������� ��������� (I)';
 FormOutput.Output.cells[0,6]:= '���������������� ������ (E)';
 FormOutput.Output.cells[0,7]:= '����� ����� ���������� (N1)';
 FormOutput.Output.cells[0,8]:= '����� ����� ��������� (N2)';
 FormOutput.Output.cells[0,9]:= '����� ���������� ���������� (n1)';
 FormOutput.Output.cells[0,10]:= '����� ���������� ��������� (n2)';
 FormOutput.Output.cells[0,11]:= '����� ��������� ( N = N1 + N2 )';
 FormOutput.Output.cells[0,12]:= '������� ��������� ( n = n1 + n2 )';
 FormOutput.Output.cells[0,13]:= '����� ���������( V = N * log2(n) )';

  operatorsAllCount := 0;
  operandsAllCount := 0;

  Memo := Memo_inputFile;
  operatorsCount := Research_Operators(Memo, operatorsAllCount);
  operatorsAllCount := operatorsAllCount + operatorsCount;
  operandsCount := Operands_Search(Memo, operandsAllCount);
  operandsAllCount := operandsAllCount + operandsCount;
  FormOutput.Output.cells[1,7]:= IntToStr(operatorsAllCount);
  FormOutput.Output.cells[1,8] := IntToStr(operandsAllCount);

  operatorsInUniqueMassiveCount := 0;
  for i := 1 to operatorsAllCount-1 do
  begin
    analyzeString := ArrayAllOperators[i];
    operatorsInMassiveCount := 0;

    for j := 1 to operatorsAllCount-1 do
      if analyzeString = ArrayAllOperators[j] then inc(operatorsInMassiveCount);

    if operatorsInMassiveCount = 1 then
    begin
      inc(operatorsInUniqueMassiveCount);
      ArrayParticularOperators[operatorsInUniqueMassiveCount] := analyzeString;
    end;
  end;
  FormOutput.Output.cells[1,9]:= IntToStr(operatorsInUniqueMassiveCount);

  operandsInUniqueMassiveCount := 0;
  for i := 1 to operandsAllCount-1 do
  begin
    analyzeString := ArrayAllOperands[i];
    operandsInMassiveCount := 0;

    for j := 1 to operandsAllCount-1 do
      if analyzeString = ArrayAllOperands[j] then inc(operandsInMassiveCount);

    if operandsInMassiveCount = 1 then
    begin
      inc(operandsInUniqueMassiveCount);
     ArrayParticularOperands[operandsInUniqueMassiveCount] := analyzeString;
    end;
  end;
  FormOutput.Output.cells[1,10]:= IntToStr(operandsInUniqueMassiveCount);

  lengthOfProgram := StrToInt(FormOutput.Output.cells[1,7]) + StrToInt(FormOutput.Output.cells[1,8]);
  FormOutput.Output.cells[1,11] := IntToStr(lengthOfProgram);

  dictionaryOfProgram := StrToInt(FormOutput.Output.cells[1,9]) + StrToInt(FormOutput.Output.cells[1,10]);
  FormOutput.Output.cells[1,12] := IntToStr(dictionaryOfProgram);

  volumeOfProgram := lengthOfProgram*Log2(dictionaryOfProgram);
  temporaryRoundResultValue := RoundTo(volumeOfProgram, -digitTwo);
  FormOutput.Output.cells[1,13] := FloatToStr(temporaryRoundResultValue);

  teoreticLengthOfProgram := StrToInt(FormOutput.Output.cells[1,9])*Log2(StrToInt(FormOutput.Output.cells[1,9])) + StrToInt(FormOutput.Output.cells[1,10])*Log2(StrToInt(FormOutput.Output.cells[1,10]));
  temporaryRoundResultValue := RoundTo(teoreticLengthOfProgram, -digitThree);
  FormOutput.Output.cells[1,0] := FloatToStr(temporaryRoundResultValue);

  levelQualityOfProgram := (digitTwo*StrToInt(FormOutput.Output.cells[1,8]))/(StrToInt(FormOutput.Output.cells[1,7])*StrToInt(FormOutput.Output.cells[1,8]));
  temporaryRoundResultValue := RoundTo(levelQualityOfProgram, -digitThree);
  FormOutput.Output.cells[1,1]:= FloatToStr(temporaryRoundResultValue);

  teoreticVolumeOfProgram := levelQualityOfProgram * volumeOfProgram;
  temporaryRoundResultValue := RoundTo(teoreticVolumeOfProgram, -digitThree);
  FormOutput.Output.cells[1,2] := FloatToStr(temporaryRoundResultValue);

  complexityUnderstandingOfProgram := volumeOfProgram / (levelQualityOfProgram *digitTwo);
  temporaryRoundResultValue := RoundTo(complexityUnderstandingOfProgram, -digitThree);
  FormOutput.Output.cells[1,3] := FloatToStr(temporaryRoundResultValue);

  complexityOfCoding := 1 / levelQualityOfProgram;
  temporaryRoundResultValue := RoundTo(complexityOfCoding, -digitThree);
  FormOutput.Output.cells[1,4] := FloatToStr(temporaryRoundResultValue);

  informationContentOfProgram := volumeOfProgram / complexityOfCoding;
  temporaryRoundResultValue := RoundTo(informationContentOfProgram, -digitThree);
  FormOutput.Output.cells[1,5] := FloatToStr(temporaryRoundResultValue);





  intellectualEffortsOfProgram := teoreticLengthOfProgram * Log2(dictionaryOfProgram/levelQualityOfProgram);
  temporaryRoundResultValue := RoundTo(intellectualEffortsOfProgram, -digitThree);
  FormOutput.Output.cells[1,6]:= FloatToStr(temporaryRoundResultValue);
   FormOutput.Show;



end;

end.
