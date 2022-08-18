unit ufrmBuscarPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmTemplateBuscar, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Data.Bind.Controls,
  Vcl.ExtCtrls, Vcl.Bind.Navigator,System.Generics.Collections, System.Classes;

type
  TfrmBuscarPedidos = class(TfrmTemplateBuscar)
    tableTemp: TFDMemTable;
    tableTempid: TIntegerField;
    tableTempemissao: TStringField;
    tableTempcodcliente: TStringField;
    tableTempcliente: TStringField;
    procedure btnBuscarClick(Sender: TObject);
    procedure gridBuscaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarPedidos: TfrmBuscarPedidos;

implementation
    uses uclassePedidos, ufrmPedidos;
{$R *.dfm}

procedure TfrmBuscarPedidos.btnBuscarClick(Sender: TObject);
 var pedidoatual : Tpedidos;
     templistapedidos: TObjectList<Tpedidos>;
     contador : integer;
  begin
   pedidoatual:=Tpedidos.Create;
   templistapedidos := pedidoatual.buscarPedido(edtBuscar.text,'lista');
   tableTemp.EmptyDataSet;
    for contador := 0 to (templistapedidos.Count-1) do
     begin
        tableTemp.Insert;
        tableTempid.asstring := inttostr(templistapedidos[contador].id);
        tableTempemissao.asstring :=  FormatDateTime('dd/mm/yyyy',templistapedidos[contador].emissao);
        tableTempcodcliente.asstring :=  inttostr(templistapedidos[contador].cliente);
        tableTempcliente.asstring :=  templistapedidos[contador].desccliente;
        tableTemp.Post;
       end;
       labEncontrados.Caption:='Encontrados : '+inttostr(templistapedidos.Count);
  end;


procedure TfrmBuscarPedidos.gridBuscaDblClick(Sender: TObject);
 var pedidoatual : Tpedidos;
     temppedido: TObjectList<Tpedidos>;
     contador : integer;
     tempitens: TObjectList<Titenspedido>;
     itens : Titenspedido;
     total : double;
  begin
   if (tableTemp.IsEmpty) then
   exit;

   pedidoatual:=Tpedidos.Create;
   itens := Titenspedido.Create;
   temppedido := pedidoatual.buscarPedido(tableTempid.asstring,'individual');
   with frmPedidos do
     begin
        labIdAtual.caption:= inttostr(temppedido.Items[0].id);
        dtEmissao.Date:= temppedido[0].emissao;
        edtCliente.Text:= floattostr(temppedido[0].cliente);
        edtDesccliente.Text:= temppedido[0].desccliente;
        tableTempItens.EmptyDataSet;
        tempitens := itens.buscarItens(tableTempid.asstring);
        total :=0;
        for contador := 0 to (tempitens.Count-1) do
        begin
            tableTempItens.Insert;
            tableTempItensid.value:=tempitens[contador].produto;
            tableTempItensdescricao.asstring := tempitens[contador].descproduto;
            tableTempItenspreco.asstring:=floattostr(tempitens[contador].precounitario);
            tableTempItensqtd.AsString:=floattostr(tempitens[contador].quantidade);
            tableTempItenstotal.AsString:=floattostr(tempitens[contador].totalunitario);
            tableTempItens.Post;
            total := total + tempitens[contador].totalunitario;
        end;
        labTotal.Caption := floattostr(total);
        grpPrincipal.Enabled:=true;
        AtivarBotoes(1);
     end;
     ModalResult:=mrok;
  end;
end.
