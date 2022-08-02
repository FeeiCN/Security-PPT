When  Space     Elephants  A/ack  
DEFCON  19   Presented  by  Abstrct    

Who  Am  I?  
­ Expert  in  designing  videogame  UI   ­ Specialized  in  Human--Computer  InteracJon   ­ Graphic  Designer   ­ Technical  Writer  

Who  am  I  really?  
Database  and  InformaJon  Security  Geek  

What  is  The  Schemaverse?  
· Space  game  built  enJrely  in  PostgreSQL     · No  UI  other  than  the  output  of  SQL  queries   · Database  is  completely  open  to  the  Internet   · Security  implemented  within  the  database  
itself   · Unexpectedly  addicJve,  fun  and  challenging  

Why?  
· Be  Educated  and  Educate  on  Database  Design   and  Security  
· Push  Database  Systems  
· It's  also  pre/y  funny  

Architecture  

SECURITY  

Securing  PostgreSQL..  Insecurely  
· Query  Limits   · AuthenJcaJon   · SQL  InjecJons  
· some  database  communiJes  were  less  than   helpful  

SQL  InjecJon  Example  
-- Fleet Script Creation! EXECUTE '! CREATE OR REPLACE FUNCTION FLEET_SCRIPT_'|| NEW.id ||'()
RETURNS boolean as ! $fleet_script$! DECLARE!
this_fleet_id integer;! ' || NEW.script_declarations || '! BEGIN ! this_fleet_id := '|| NEW.id||';! ' || NEW.script || '! RETURN 1;! END ! $fleet_script$ LANGUAGE plpgsql;'::TEXT;  

SQL  InjecJon  Example  
-- Fleet Script Creation! EXECUTE '! CREATE OR REPLACE FUNCTION FLEET_SCRIPT_'|| NEW.id ||'() RETURNS boolean as ! $fleet_script$! DECLARE!
this_fleet_id integer;! ' || NEW.script_declarations || '! BEGIN ! this_fleet_id := '|| NEW.id||';! ' || `! UPDATE player SET balance=0; ! RETURN 1;! END ! $fleet_script$ LANGUAGE plpgsql SECURITY DEFINER; ! CREATE OR REPLACE FUNCTION MOVE() RETURNS boolean as ! $fleet_script$! BEGIN! --add the move code but altered slightly to send players backwards! ` || '! RETURN 1;! END ! $fleet_script$ LANGUAGE plpgsql;'::TEXT;  

SQL  InjecJon  Fix  
-- Fleet Script Creation! secret := 'fleet_script_' || (RANDOM()*1000000)::integer;! EXECUTE '! CREATE OR REPLACE FUNCTION FLEET_SCRIPT_'|| NEW.id ||'()
RETURNS boolean as ! $'||secret||'$! DECLARE!
this_fleet_id integer;! ' || NEW.script_declarations || '! BEGIN ! this_fleet_id := '|| NEW.id||';! ' || NEW.script || '! RETURN 1;! END ! $'||secret||'$ LANGUAGE plpgsql;'::TEXT;  

SchemaSecurity    
· Roles   · Triggers   · Rules     · Views   · FuncJons  

UNDERSTANDING  THE  GAME  

GeYng  Started     
· Using  a  client  to  connect  
­ pgAdmin  Demo  

Sequence  of  a  Tic    
· Every  Ship  Moves   · All  Enabled  Fleets  Execute   · The  Perform  Mining  FuncJon  Runs   · Some  planets  randomly  have  their  fuel  
increased   · Damage/Repair  is  commi/ed  to  the  ship  table   · Ships  damaged  for  a  set  Jme  are  destroyed   · Jc_seq.nextval  

Understanding  the  RelaJonships  
· Ships     · Planets   · Events     · Player     · Fleets  

CreaJng  Ships  
· INSERT  INTO  my_ships(name)  VALUES('Shipington');  
· INSERT  INTO  my_ships(name,  a/ack,  defense,  engineering,   prospecJng)  VALUES('My  First  A/acker',15,5,0,0);  
­ Total  skill  on  insert  must  not  be  greater  than  20  
· INSERT  INTO  my_ships(name,  locaAon_x,  locaAon_y)  VALUES("My   Strategically  Placed  Ship",  100,  100);    
­ You  can  only  create  a  ship  where  one  of  the  following  is  true:  
· locaJon_x  and  locaJon_y  is  between  --3000  and  3000     · locaJon_x  and  locaJon_y  are  the  same  coordinates  as  a  planet  you  are  the  
current  conqueror  of  

FuncJons  --  AcJons  
· A/ack(A/ackerShip,  EnemyShip)   SELECT  ALack(ship_in_range_of,  id),  name  FROM  ships_in_range;   Uses  my_ships.aLack  and  your  enemy  ships  defense  
· Repair(RepairShip,  DamagedShip)   SELECT  Repair(10,  id)  FROM  my_ships  ORDER  BY  current_health  ASC;   Uses  my_ships.engineering  to  determine  repair  amount  
· Mine(MinerShip,  Planet)   SELECT  mine(my_ships.id,  planets.id)  FROM  my_ships,  planets       WHERE  my_ships.locaAon_x=planets.locaAon_x  AND                  my_ships.locaAon_y=planets.locaAon_y;   Uses  luck  and  my_ships.prospecAng  when  mining  is  performed  

FuncJons  --  MOVE  
· Move(Ship  ID,  Speed,  DirecAon,     DesAnaAon  X,  DesAnaAon  Y)  
SELECT MOVE(id,100, NULL, destination_x, destination_y), id, name, location_x, location_y FROM my_ships;
UPDATE  my_ships  SET           direcAon=90,           speed=10     WHERE  name='Shipington'  

FuncJons  --  Others  
· UPGRADE(Ship  ID,  Code,  QuanJty)   · REFUEL_SHIP(Ship  ID)   · CONVERT_RESOURCE(Resource,  QuanJty)   · READ_EVENT(Event  ID)   · GET_CHAR_VARIABLE(Variable  Name)   · GET_NUMERIC_VARIABLE(Variable  Name)   · And  some  more  

How  to  Win  
· Conquered  Planets   · Most  Ships   · Best  Ships   · Most  amount  of  destrucJon    

FLEET  SCRIPTS  

· Why   · What   · How  

Fleets  

· Demo  of  creaJng  a  script   · Error  handling  

· First  ever  Schemaverse  Tournament  at  DEFCON!   · Starts:  Thursday  ahernoon(?)   · Ends:  Sunday  at  Noon   · RegistraJon  is  in  the  Contest  Area   · Prizes  Include...  

· The  Schemaverse  DEFCON  Tournament  
­ h/p://defcon.schemaverse.com  
· Project  Home:  h/p://Schemaverse.com   · Github:  h/p://github.com/Absrtct/Schemaverse   · Wiki:  h/p://github.com/Absrtct/Schemaverse/Wiki  

Thank  You  
DEFCON  19  Organizers!  
Tigereye   appl   rick  

