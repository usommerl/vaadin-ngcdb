drop table images;

begin
    ctx_ddl.drop_preference('lexer');
    ctx_ddl.drop_preference('storage');
end;
/

