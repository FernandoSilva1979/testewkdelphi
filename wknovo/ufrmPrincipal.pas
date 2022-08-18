unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    ImageMenu: TImageList;
    ImageNavigator: TImageList;
    ToolBar1: TToolBar;
    ToolButton13: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
implementation
uses ufrmClientes, ufrmProdutos, ufrmPedidos;
{$R *.dfm}

procedure TfrmPrincipal.ToolButton3Click(Sender: TObject);
begin
   try
      frmProdutos := TfrmProdutos.Create(Self);    //  formes criados e destruidos em tempo de execaucao
      frmProdutos.ShowModal;
   finally
      freeandnil(frmProdutos)
   end;
end;


procedure TfrmPrincipal.ToolButton4Click(Sender: TObject);
begin
    try
       frmClientes := TfrmClientes.Create(Self);    //  formes criados e destruidos em tempo de execaucao
       frmClientes.ShowModal;
    finally
      freeandnil(frmClientes)
    end;
end;


procedure TfrmPrincipal.ToolButton5Click(Sender: TObject);
begin
   try
      frmPedidos := TfrmPedidos.Create(Self);    //  formes criados e destruidos em tempo de execaucao
      frmPedidos.ShowModal;
   finally
      freeandnil(frmPedidos)
   end;
end;

end.
