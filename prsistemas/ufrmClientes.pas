unit ufrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmTemplateCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Menus, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdAuthentication, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  Vcl.Mask;

type
  TfrmClientes = class(TfrmTemplateCadastro)
    labNome: TLabel;
    labCep: TLabel;
    labLogradouro: TLabel;
    labNro: TLabel;
    labBairro: TLabel;
    labCidade: TLabel;
    labUf: TLabel;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtNro: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtUf: TEdit;
    XMLDocument1: TXMLDocument;
    edtCep: TMaskEdit;
    btnBuscarcep: TButton;
    labCpf: TLabel;
    edtCpf: TEdit;
    edtRg: TEdit;
    labRg: TLabel;
    labPai: TLabel;
    edtPai: TEdit;
    labMae: TLabel;
    edtMae: TEdit;
    Label1: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BuscarCep(Cep : string);
    procedure btnBuscarcepClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation
    uses ufrmBuscarClientes,uclasseclientes;
{$R *.dfm}

 procedure TfrmClientes.btnBuscarClick(Sender: TObject);
begin
   try
     frmBuscarClientes := TfrmBuscarClientes.Create(Self);    //  formes criados e destruidos em tempo de execaucao
     frmBuscarClientes.ShowModal;
   finally
     freeandnil(frmBuscarClientes);
   end;
end;


procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtCep.Text :='';
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
 var clienteatual : Tclientes;
     sucesso : Boolean;
begin
  inherited;
  if (labCodigoAtual.caption='0') then
  begin
    showmessage('selecione registro');
    exit;
  end;

  If  MessageDlg('Você tem certeza que deseja excluir o registro?',mtConfirmation,[mbyes,mbno],0)=mryes    then
   begin
      clienteatual:=Tclientes.Create;
      sucesso := clienteatual.deletarCliente(strtoint(labCodigoAtual.caption));
      if (sucesso=true) then
      showmessage('Exclusao Confirmada !!!');
      btnCancelar.Click;
   end;
end;


procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;


procedure TfrmClientes.btnSalvarClick(Sender: TObject);
 var clienteatual : Tclientes;
     sucesso : Boolean;
     cepformatado : string;
     i : integer;
begin
     if ((edtNome.Text='') or (edtCpf.text='')
         or (edtRg.Text='') or (edtPai.text='')
         or (edtMae.Text='') or (edtCep.text='')
         or (edtEndereco.Text='') or (edtNro.text='')
         or (edtBairro.Text='') or (edtCidade.text='')
         or (edtUf.Text='')) then
        begin
          showmessage('Erro !!! Verifique Campos obrigatórios');
          exit;
        end;


     for i := 1 to Length(edtCep.text) do
      begin
        if Pos(Copy(edtCep.text, i, 1), '-.') = 0 then
         cepformatado := cepformatado + Copy(edtCep.text, i, 1);
      end;


     clienteatual:=Tclientes.Create;
     if (labCodigoAtual.Caption='Novo') then
     clienteatual.id:=0
     else
     clienteatual.id:=strtoint(labCodigoAtual.caption);
     clienteatual.nome:=edtNome.Text;
     clienteatual.cpf:=edtCpf.Text;
     clienteatual.rg:=edtRg.Text;
     clienteatual.nomepai:=edtPai.Text;
     clienteatual.nomemae:=edtMae.Text;
     clienteatual.cep:=strtoint(cepformatado);
     clienteatual.endereco:=edtEndereco.Text;
     clienteatual.nro:=strtoint(edtNro.Text);
     clienteatual.bairro:=edtBairro.Text;
     clienteatual.cidade:=edtCidade.Text;
     clienteatual.uf:=edtUf.Text;

     if (labCodigoAtual.Caption='Novo') then
          begin
             sucesso := clienteatual.salvarCliente(clienteatual,'incluir');   // inserção de cliente passando do objeto
             clienteatual.Free;
             if (sucesso) then
               showmessage('Cliente Cadastrado !!!');

             LimparTela;
             edtCep.Text:='';
             labCodigoAtual.Caption:='0';
          end
          else
     if (labCodigoAtual.Caption <> 'Nenhum') then
         begin
          sucesso:=clienteatual.salvarCliente(clienteatual,'alterar');        // alteracao de clientea passando do objeto
          if (sucesso) then
             showmessage('Cliente Atualizado !!!');
         end;
end;


procedure TfrmClientes.BuscarCep(Cep: string);
var
  tempXML :IXMLNode;
  tempNodePAI :IXMLNode;
  tempNodeFilho :IXMLNode;
  I :Integer;
begin
   XMLDocument1.FileName := 'https://viacep.com.br/ws/'+Trim(Cep)+ '/xml/';
   XMLDocument1.Active := true;
   tempXML := XMLDocument1.DocumentElement;
   tempNodePAI := tempXML.ChildNodes.FindNode('logradouro');

   if (tempNodePAI=nil) then
    begin
      showmessage('cep não encontrado !!!');
      edtcep.Text:='';
      exit;
    end;

   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      edtEndereco.Text :=  tempNodeFilho.Text;
   end;
   tempNodePAI := tempXML.ChildNodes.FindNode('bairro');
   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      edtBairro.text := tempNodeFilho.Text;
   end;
  tempNodePAI := tempXML.ChildNodes.FindNode('localidade');
   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      edtCidade.text := tempNodeFilho.Text;
   end;
  tempNodePAI := tempXML.ChildNodes.FindNode('uf');
   for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
   begin
      tempNodeFilho := tempNodePAI.ChildNodes[i];
      edtUf.Text := tempNodeFilho.Text;
   end;
end;


procedure TfrmClientes.btnBuscarcepClick(Sender: TObject);
var cepformatado : string;
    i: integer;
begin
 if (edtCep.Text='     -   ') then
 begin
   showmessage('Forneca cep !!!');
   edtCep.SetFocus;
   exit;
 end;

 for i := 1 to Length(edtCep.text) do
    begin
      if Pos(Copy(edtCep.text, i, 1), '-.') = 0 then
       cepformatado := cepformatado + Copy(edtCep.text, i, 1);
    end;
    BuscarCep(cepformatado);
 end;

end.
