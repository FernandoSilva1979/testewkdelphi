program ProjWK;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  ufrmTemplateCadastro in 'ufrmTemplateCadastro.pas' {frmTemplateCadastro},
  ufrmTemplateBuscar in 'ufrmTemplateBuscar.pas' {frmTemplateBuscar},
  udmModule in 'udmModule.pas' {dmModule: TDataModule},
  ufrmClientes in 'ufrmClientes.pas' {frmClientes},
  ufrmBuscarClientes in 'ufrmBuscarClientes.pas' {frmBuscarClientes},
  uclasseClientes in 'uclasseClientes.pas',
  uclasseProdutos in 'uclasseProdutos.pas',
  ufrmProdutos in 'ufrmProdutos.pas' {frmProdutos},
  ufrmBuscarProdutos in 'ufrmBuscarProdutos.pas' {frmBuscarProdutos},
  uclassePedidos in 'uclassePedidos.pas',
  ufrmPedidos in 'ufrmPedidos.pas' {frmPedidos},
  ufrmBuscarPedidos in 'ufrmBuscarPedidos.pas' {frmBuscarPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTemplateCadastro, frmTemplateCadastro);
  Application.CreateForm(TfrmTemplateBuscar, frmTemplateBuscar);
  Application.CreateForm(TdmModule, dmModule);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmBuscarClientes, frmBuscarClientes);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.CreateForm(TfrmBuscarProdutos, frmBuscarProdutos);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TfrmBuscarPedidos, frmBuscarPedidos);
  Application.Run;
end.
