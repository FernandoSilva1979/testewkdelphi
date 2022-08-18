unit ufrmPedidos;

interface

uses
  System.SysUtils, Winapi.Windows,System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Phys.ADSDef,
  FireDAC.Phys.ADS, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,Dialogs,
  ufrmTemplateCadastro, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Controls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Buttons, System.Classes;


type
  TfrmPedidos = class(TfrmTemplateCadastro)
    DBGrid1: TDBGrid;
    labTotal: TLabel;
    labEmissao: TLabel;
    labCliente: TLabel;
    edtCliente: TEdit;
    dtEmissao: TDateTimePicker;
    btnIncluiritens: TButton;
    tableTempItens: TFDMemTable;
    tableTempItensid: TIntegerField;
    tableTempItensdescricao: TStringField;
    tableTempItenspreco: TStringField;
    dsTemp: TDataSource;
    tableTempItensqtd: TFloatField;
    tableTempItenstotal: TFloatField;
    panNovoItem: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCoditem: TEdit;
    edtDescricaoitem: TEdit;
    edtPrecoitem: TEdit;
    edtQtd: TEdit;
    Button2: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    edtDesccliente: TEdit;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnIncluiritensClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure atualizarItens(vUlt_id : integer);
    procedure GroupBox1Exit(Sender: TObject);
    procedure edtCoditemExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCoditemKeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;
  operacao : string;
implementation

{$R *.dfm}

uses ufrmBuscarPedidos,uclassePedidos,uclasseProdutos,uclasseClientes;

procedure TfrmPedidos.atualizarItens(vUlt_id : integer);
var itenspedido : Titenspedido;
    excluiritenspedido : Titenspedido;
    total:double;
begin
   itenspedido := Titenspedido.Create;
   excluiritenspedido := Titenspedido.Create;
   excluiritenspedido.ExcluirItens(vUlt_id);
   with tableTempItens do
    begin
       First;
       total:=0;
       while not eof  do
        begin
          itenspedido.iditens :=vUlt_id;
          itenspedido.produto  := fieldbyname('id').value;
          itenspedido.quantidade := fieldbyname('qtd').value;
          itenspedido.precounitario := fieldbyname('preco').value;
          itenspedido.totalunitario := (fieldbyname('qtd').value * fieldbyname('preco').value);
          itenspedido.atualizarItens(itenspedido);
          next
        end;
    end;
end;


procedure TfrmPedidos.btnBuscarClick(Sender: TObject);
begin
   try
     frmBuscarPedidos := TfrmBuscarPedidos.Create(Self);    //  formes criados e destruidos em tempo de execaucao
     frmBuscarPedidos.ShowModal;
   finally
     freeandnil(frmBuscarPedidos);
   end;
end;

procedure TfrmPedidos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  tableTempItens.EmptyDataSet;
  labTotal.Caption := '0,00';
end;

procedure TfrmPedidos.btnExcluirClick(Sender: TObject);
 var pedidoatual : Tpedidos;
     sucesso : Boolean;
     excluiritenspedido : Titenspedido;
begin
   inherited;
   pedidoatual:=Tpedidos.Create;
   excluiritenspedido := Titenspedido.Create;
   excluiritenspedido.ExcluirItens(strtoint(labIdAtual.caption));
   sucesso := pedidoatual.deletarPedido(strtoint(labIdAtual.caption));
   if (sucesso=true) then
     showmessage('Exclusao Confirmada !!!');
  btnCancelar.Click;
end;


procedure TfrmPedidos.btnNovoClick(Sender: TObject);
begin
  inherited;
  labTotal.Caption:='0';
end;


procedure TfrmPedidos.btnSalvarClick(Sender: TObject);
 var pedidoatual : Tpedidos;
     vUlt_id : integer;
     listaitens : TObjectList<Titenspedido>;
     i : integer;
     itens : Titenspedido;
     atualizartotal : Titenspedido;
begin
   if ((edtDesccliente.text='') or
      (edtCliente.text='') or (tableTempItens.IsEmpty)) then
       begin
         showmessage('Erro !!! Verifique Campos Obrigatorios !!!');
         exit;
       end;

     pedidoatual:=TPedidos.Create;
     itens := Titenspedido.Create;
     atualizartotal := Titenspedido.Create;

     if (labIdAtual.Caption='Novo') then
     pedidoatual.id:=0
     else
        pedidoatual.id:=strtoint(labIdAtual.caption);
        pedidoatual.emissao:=dtEmissao.date;
        pedidoatual.cliente:=strtoint(edtCliente.Text);
        pedidoatual.total:=strtofloat(labTotal.Caption);

      if (labIdAtual.Caption='Novo') then
          begin
             vUlt_id := pedidoatual.salvarPedido(pedidoatual,'incluir');   // inser��o de cliente passando do objeto
             pedidoatual.Free;
               labIdAtual.Caption:=inttostr(vUlt_id);
          end
          else
     if (labIdAtual.Caption <> 'Nenhum') then
          vUlt_id :=pedidoatual.salvarPedido(pedidoatual,'alterar');        // alteracao de clientea passando do objeto

        atualizarItens(vUlt_id);
        labTotal.Caption:=formatfloat('0.00',atualizartotal.AtualizarTotal(vUlt_id));

        showmessage('Pedido Salvo !!!');
end;


procedure TfrmPedidos.btnIncluiritensClick(Sender: TObject);
begin
  operacao := 'incluir';
  panNovoItem.Visible:=true;
end;

procedure TfrmPedidos.Button2Click(Sender: TObject);
var atualizartotal : Titenspedido;
    total,totalalterado : double;
begin
   if ((edtCoditem.Text='') or (edtQtd.Text='') or (edtPrecoitem.Text='')) then
   begin
     showmessage('Erro !!! Verifique campos obrigat�rios');
     exit;
   end;

   totalalterado :=0;
   if (operacao='alterar') then
   begin
     totalalterado := tableTempItenstotal.AsFloat;
     tableTempItens.Delete;
   end;


   atualizartotal := Titenspedido.Create;
   total :=0;
   if (edtDescricaoitem.Text='') then
     begin
       showmessage('Selecione Produto !!!');
       exit;
     end;

   total := strtofloat(labTotal.Caption) -totalalterado+ (strtofloat(edtQtd.Text)*strtofloat(edtPrecoitem.Text));

   tableTempItens.Insert;
   tableTempItensid.AsString:=edtCoditem.Text;
   tableTempItensdescricao.AsString:=edtDescricaoitem.Text;
   tableTempItenspreco.AsString:=edtPrecoitem.Text;
   tableTempItensqtd.AsString:=edtQtd.Text;
   tableTempItenstotal.AsString:=floattostr(strtofloat(edtQtd.Text)*strtofloat(edtPrecoitem.Text));
   tableTempItens.Post;
   labTotal.Caption:=formatfloat('0.00',total);
   panNovoItem.Visible:=false;
end;


procedure TfrmPedidos.Button3Click(Sender: TObject);
begin
    panNovoItem.Visible:=false;
end;


procedure TfrmPedidos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=VK_DELETE) then
   begin
    If  MessageDlg('Voc� tem certeza que deseja excluir o registro?',mtConfirmation,[mbyes,mbno],0)=mryes    then
       begin
         labTotal.Caption:=floattostr(strtofloat(labtotal.Caption) - (tableTempItenstotal.AsFloat));
         tableTempItens.Delete;
       end;
   end;

  if (key=VK_RETURN) then
  begin
     operacao := 'alterar';
     edtCoditem.Text := tableTempItensid.AsString;
     edtDescricaoitem.Text := tableTempItensdescricao.AsString;
     edtQtd.Text := tableTempItensqtd.AsString;
     edtPrecoitem.Text := tableTempItenspreco.AsString;
     panNovoItem.Visible:=true;
  end;


end;


procedure TfrmPedidos.edtClienteExit(Sender: TObject);
var buscacliente : Tclientes;
     tempcliente: TObjectList<Tclientes>;
begin
   buscacliente := Tclientes.Create;
   tempcliente := buscacliente.buscarCliente(edtCliente.Text,'Individual');
    if tempcliente.Count=0 then
      begin
        showmessage('Cliente n�o encontrado !!!!');
        edtDesccliente.Text :='';
        exit;
      end;
    edtDesccliente.Enabled:=true;
    edtDesccliente.text:= tempcliente.Items[0].nome;
    edtDesccliente.Enabled:=false;
end;


procedure TfrmPedidos.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then
     edtCliente.OnExit(Sender);
end;

procedure TfrmPedidos.edtCoditemExit(Sender: TObject);
var buscaproduto : Tprodutos;
     tempproduto: TObjectList<Tprodutos>;
begin
   buscaproduto := Tprodutos.Create;
   tempproduto := buscaproduto.buscarProduto(edtCoditem.Text,'Individual');
    if tempproduto.Count=0 then
      begin
        showmessage('Produto n�o encontrado !!!!');
        edtDescricaoitem.Text:='';
        edtPrecoitem.Text:='';
        edtQtd.Text:='';
        exit;
      end;

    edtDescricaoitem.Enabled:=true;
    edtDescricaoitem.text:= tempproduto.Items[0].descricao;
    edtPrecoitem.Text:= floattostr(tempproduto[0].preco_venda);
    edtDescricaoitem.Enabled:=false;
end;


procedure TfrmPedidos.edtCoditemKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then
     edtCoditem.OnExit(Sender);
end;

procedure TfrmPedidos.FormActivate(Sender: TObject);
begin
  inherited;
  panNovoItem.Visible:=false;
end;


procedure TfrmPedidos.GroupBox1Exit(Sender: TObject);
begin
  edtCoditem.Text :='';
  edtDescricaoitem.text :='';
  edtQtd.text :='';
  edtPrecoitem.text :='';
end;

end.
