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
    labCidade: TLabel;
    labUf: TLabel;
    edtNome: TEdit;
    edtCidade: TEdit;
    edtUf: TEdit;
    XMLDocument1: TXMLDocument;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
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


procedure TfrmClientes.btnExcluirClick(Sender: TObject);
 var clienteatual : Tclientes;
     sucesso : Boolean;
begin
  inherited;
  If  MessageDlg('Voc? tem certeza que deseja excluir o registro?',mtConfirmation,[mbyes,mbno],0)=mrno    then
  exit;

  clienteatual:=Tclientes.Create;
  sucesso := clienteatual.deletarCliente(strtoint(labIdAtual.caption));
  if (sucesso=true) then
  showmessage('Exclusao Confirmada !!!');
  btnCancelar.Click;
end;


procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;


procedure TfrmClientes.btnSalvarClick(Sender: TObject);
 var clienteatual : Tclientes;
     sucesso : Boolean;
begin
     if ((edtNome.Text='') or (edtCidade.text='') or
        (edtUf.Text='')) then
        begin
          showmessage('Erro !!! Verifique Campos obrigat?rios');
          exit;
        end;

     clienteatual:=Tclientes.Create;
     if (labIdAtual.Caption='Novo') then
     clienteatual.id:=0
     else
     clienteatual.id:=strtoint(labIdAtual.caption);
     clienteatual.nome:=edtNome.Text;
     clienteatual.cidade:=edtCidade.Text;
     clienteatual.uf:=edtUf.Text;

     if (labIdAtual.Caption='Novo') then
          begin
             sucesso := clienteatual.salvarCliente(clienteatual,'incluir');   // inser??o de cliente passando do objeto
             clienteatual.Free;
             LimparTela;
             labIdAtual.Caption:='0';
          end
          else
     if (labIdAtual.Caption <> 'Nenhum') then
          sucesso:=clienteatual.salvarCliente(clienteatual,'alterar');        // alteracao de clientea passando do objeto

     if (sucesso) then
        showmessage('Cliente Salvo !!!');
end;

end.
