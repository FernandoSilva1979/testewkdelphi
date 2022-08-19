unit uclasseClientes;

interface
   uses
  System.SysUtils, System.Generics.Collections,Dialogs,Data.Win.ADODB;


 type Tclientes = class
  private
       Fid : integer;
       Fnome : string;
       Fcpf : string;
       Frg : string;
       Fnomepai : string;
       Fnomemae : string;
       Fcep : integer;
       Fendereco : string;
       Fbairro : string;
       Fnro : integer;
       Fcidade : string;
       Fuf : string;
    procedure Setid(const Value: Integer);
    procedure Setnome(const Value: String);
    procedure Setcpf(const Value: String);
    procedure Setrg(const Value: String);
    procedure Setnomepai(const Value: String);
    procedure Setnomemae(const Value: String);
    procedure Setcep(const Value: Integer);
    procedure Setendereco(const Value: String);
    procedure Setbairro(const Value: String);
    procedure Setnro(const Value: Integer);
    procedure Setcidade(const Value: String);
    procedure Setuf(const Value: String);
    public
       property id :Integer read Fid write Setid;
       property nome : String read Fnome write Setnome;
       property cpf : String read Fcpf write Setcpf;
       property rg : String read Frg write Setrg;
       property nomepai : String read Fnomepai write Setnomepai;
       property nomemae : String read Fnomemae write Setnomemae;
       property cep : Integer read Fcep write Setcep;
       property endereco : String read Fendereco write Setendereco;
       property bairro : String read Fbairro write Setbairro;
       property nro : Integer read Fnro write Setnro;
       property cidade : String read Fcidade write Setcidade;
       property uf : String read Fuf write Setuf;

       function deletarCliente(idcliente : integer) : Boolean;
       function salvarCliente(vcliente : Tclientes; acao : string): Boolean;
       function buscarCliente(busca : string; tipo : string) : TObjectList<Tclientes>;
      constructor Create();
 end;

 Type
  TListaCliente = class
  private
    FListaClientes : TObjectList<Tclientes>;
  protected
  public
    constructor Create;
    procedure Adicionar(pCliente: Tclientes);
    property ListaClientes: TObjectList<Tclientes> read FListaClientes write FListaClientes;
  published
  end;

implementation
   uses udmModule;
{ Tclientes }

function Tclientes.salvarCliente(vcliente : Tclientes; acao : string): Boolean;                 // insercao de produtos no pedido
var Fado_Query : TADOQuery;
    vErro : boolean;
    vUlt_id : integer;

begin
  Fado_Query := TADOQuery.Create(nil);
  with Fado_Query do
  begin
     connection:= dmModule.conexaoBanco;
     try
       vErro := true;
       connection.BeginTrans;
       if (acao='incluir') then
       begin
         close;
         sql.clear;
         sql.Add('INSERT INTO clientes (nome,cpf,rg,nomepai,nomemae) '
                +' values ('''+ vcliente.nome
                +''','''+vcliente.cpf
                +''','''+vcliente.rg
                +''','''+vcliente.nomepai
                +''','''+vcliente.nomemae+''')');
          execsql;

         close;
         sql.clear;
         sql.add('SELECT @@IDENTITY AS Ult_id');
         Open;
         vUlt_id:=fieldbyname('Ult_id').value;


         close;
         sql.clear;
         sql.Add('INSERT INTO clienteendereco (idcliente,cep,endereco,nro,bairro,cidade,uf) '
                +' values ('''+ inttostr(vUlt_id)
                +''','''+inttostr(vcliente.cep)
                +''','''+vcliente.endereco
                +''','''+inttostr(vcliente.nro)
                +''','''+vcliente.bairro
                +''','''+vcliente.cidade
                +''','''+vcliente.uf+''')');
          execsql;

        end
        else
        begin
         close;
         sql.clear;
         sql.Add('update clientes set nome=''' + vcliente.nome
                +''' ,cpf='''+vcliente.cpf
                +''' ,rg='''+vcliente.rg
                +''' ,nomepai='''+vcliente.nomepai
                +''' ,nomemae='''+vcliente.nomemae
                +''' where id='''+ inttostr(vcliente.id)+'''');
          execsql;

         close;
         sql.clear;
         sql.Add('update clienteendereco set cep=''' + inttostr(vcliente.cep)
                +''' ,endereco='''+vcliente.endereco
                +''' ,nro='''+inttostr(vcliente.nro)
                +''' ,bairro='''+vcliente.bairro
                +''' ,cidade='''+vcliente.cidade
                +''' ,uf='''+vcliente.uf
                +''' where idcliente='''+ inttostr(vcliente.id)+'''');
          execsql;
         end;
         connection.CommitTrans;
       Except
       on E: Exception do
          begin
            ShowMessage('Erro ao Incluir Cliente : ' + E.Message );
            vErro:=false;
            connection.RollbackTrans;
          end;
     end;
     Result :=vErro;
     Free;
  end;
end;




procedure Tclientes.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure Tclientes.Setcep(const Value: Integer);
begin
    Fcep := Value;
end;

procedure Tclientes.Setcidade(const Value: String);
begin
    Fcidade := Value;
end;

procedure Tclientes.Setcpf(const Value: String);
begin
    Fcpf := Value;
end;

procedure Tclientes.Setendereco(const Value: String);
begin
    Fendereco := Value;
end;

procedure Tclientes.Setid(const Value: Integer);
begin
    Fid := Value;
end;

procedure Tclientes.Setnome(const Value: String);
begin
    Fnome := Value;
end;

procedure Tclientes.Setnomemae(const Value: String);
begin
      Fnomemae := Value;
end;

procedure Tclientes.Setnomepai(const Value: String);
begin
    Fnomepai := Value;
end;

procedure Tclientes.Setnro(const Value: Integer);
begin
    Fnro := Value;
end;

procedure Tclientes.Setrg(const Value: String);
begin
    Frg := Value;
end;

procedure Tclientes.Setuf(const Value: String);
begin
    Fuf := Value;
end;

function Tclientes.deletarCliente(idcliente : integer) : Boolean;         // excluir item com argumento de nro de pedido e cod produto
var FadoQuery : TADOQuery;
    sucesso :  boolean;
begin
  FadoQuery := TADOQuery.Create(nil);
  with FadoQuery do
   begin
     Connection:= dmModule.conexaoBanco;
     try
       Connection.BeginTrans;
       close;
       sql.clear;
       sql.add('delete from clienteendereco '+
           ' where idcliente='+QuotedStr(inttostr(idcliente)));
       execsql;

       close;
       sql.clear;
       sql.add('delete from clientes '+
           ' where id='+QuotedStr(inttostr(idcliente)));
       execsql;

       sucesso:=true;
       Connection.CommitTrans;
       Except
       on E: Exception do
          begin
            ShowMessage('Erro ao Excluir Cliente : ' + E.Message );
            Connection.RollbackTrans;
            sucesso:=false;
          end;
     end;
   Result := sucesso;
   Free;
  end;
end;



function Tclientes.buscarCliente(busca : string; tipo : string ): TObjectList<Tclientes>;
var FadoQuery : TADOQuery;
    vErro : boolean;
    tempcliente : Tclientes;
    templistacliente : TListaCliente;
    i : integer;
begin
  FadoQuery :=TADOQuery.Create(nil);
  with FadoQuery do
  begin
     try
       Connection:= dmModule.conexaoBanco;
        tempcliente:=Tclientes.Create;
        templistacliente := TListaCliente.create;
       close;
       sql.clear;
       if (tipo='lista') then
          sql.add('SELECT * from clientes as a inner join clienteendereco as B on a.id=b.idcliente '
                  + ' where (idcliente like ''%'+busca+'%'' or nome like ''%'+busca+'%'') order by idcliente')
          else
          sql.add('SELECT * from clientes as a inner join clienteendereco as B' +
                  ' on a.id=b.idcliente where a.id = '+busca);

       open;
       while not eof do
         begin
           templistacliente.FListaClientes.Add(Tclientes.Create);
           i := templistacliente.FListaClientes.Count -1;
           templistacliente.FListaClientes[i].id := fieldbyname('id').value;
           templistacliente.FListaClientes[i].nome := fieldbyname('nome').value;
           templistacliente.FListaClientes[i].cpf := fieldbyname('cpf').value;
           templistacliente.FListaClientes[i].rg := fieldbyname('rg').value;
           templistacliente.FListaClientes[i].nomepai := fieldbyname('nomepai').value;
           templistacliente.FListaClientes[i].nomemae := fieldbyname('nomemae').value;
           templistacliente.FListaClientes[i].cep := fieldbyname('cep').value;
           templistacliente.FListaClientes[i].endereco := fieldbyname('endereco').value;
           templistacliente.FListaClientes[i].nro := fieldbyname('nro').value;
           templistacliente.FListaClientes[i].bairro := fieldbyname('bairro').value;
           templistacliente.FListaClientes[i].cidade := fieldbyname('cidade').value;
           templistacliente.FListaClientes[i].uf := fieldbyname('uf').value;
           next;
       end;
       Except
       on E: Exception do
          begin
            ShowMessage('Erro ao Buscar Produto : ' + E.Message );
          end;
     end;

     Result := templistacliente.FListaClientes;
     Free;
  end;
end;


constructor Tclientes.Create;
begin
   Fid:=0;
end;






{ TListaCliente }

procedure TListaCliente.Adicionar(pCliente: Tclientes);
begin
   FListaClientes.Add(pCliente);
end;


constructor TListaCliente.Create;
begin
  FListaClientes := TObjectList<Tclientes>.Create;
end;


end.
