<?php
            class bdd{
                var $host="localhost";
                var $dbname="u898308728_bizstock";
                var $user="u898308728_mister";
                var $pass="Code@2001";
                function connect(){
                    try { 
                        $bdd = new PDO("mysql:host=".$this->host.";dbname=".$this->dbname, $this->user, $this->pass);
                        return $bdd;
                    }
                    catch   (PDOException $pe){
                        die ("I cannot connect to the database " . $pe->getMessage());
                        return null;
                    }
                }
                function listTable(){
                    $sql="SHOW TABLES";
                    $req= $this->connect()->prepare($sql);
                    $req->execute();
                    return $req->fetchAll();
                }
            }
            $bdd=new bdd();

            class tables extends bdd{
                var $table;
                var $state=false;
                var $data=[];
                function return(String $sql,String $fun,Array $values=[]):array {
                    $req= $this->connect()->prepare($sql);
                    return ["message"=>$fun." ".$this->table,"state"=>$req->execute($values),"data"=>$req->fetchAll()];
                }
                function all():array{
                    $sql="SELECT * FROM ".$this->table;
                    return $this->return($sql,__FUNCTION__);
                }

                function new($data){
                    $keys=implode(",",array_keys($data));
                    $values=array_values($data);
                    $sign="";
                    for ($i=0; $i < count($data)-1 ; $i++) { 
                        $sign=$sign."?,";
                    }
                    $sign=$sign."?";
                    $sql = "INSERT INTO ".$this->table." (".$keys.") VALUES (".$sign.")";
                    return $this->return($sql,__FUNCTION__,$values);
                }
                function byId($id){
                    $sql="SELECT * FROM ".$this->table." where id=".$id;
                    return $this->return($sql,__FUNCTION__);
                }
                function update($ids,$data){
                    $struc="";
                    foreach ($data as $key=>$value) { 
                        $struc=$struc."".$key."='".$value."',";
                    }
                    $condition="";
                    foreach ($ids as $key=>$value) { 
                        $condition=$key."='".$value."'";
                    }
                    $struc=substr($struc,0,-1);
                    $sql="UPDATE ".$this->table." set ".$struc." where ".$condition;
                    return $this->return($sql,__FUNCTION__);      
                }
                function delete($data){
                    $demand="";
                    foreach ($data as $key => $value1) {
                        $demand.=" ".$key." = '".$value1."' OR";
                    }
                    $demand=substr($demand,0,-2);
                    $sql="DELETE FROM ".$this->table." where ".$demand;
                    return $this->return($sql,__FUNCTION__);
                }
                // Search in any table
                function search($data){
                    $demand="";
                    foreach ($data as $key => $value1) {
                        $demand.=" ".$key." LIKE '%".$value1."%' OR";
                        if ($key=="all_column") {
                            $demand="";
                            $sql="DESCRIBE ".$this->table;
                            foreach ($this->return($sql,"")["data"] as $key => $value2) {
                                $demand.=" ".$value2["0"]." LIKE '%".$value1."%' OR";
                            }
                            break;
                        }
                    }
                    $demand=substr($demand,0,-2);
                    $sql="SELECT * FROM ".$this->table." where ".$demand;
                    return $this->return($sql,__FUNCTION__);
                }
                function by($data){
                    $demand="";
                    foreach ($data as $key => $value1) {
                        $demand.=" ".$key." = '".$value1."' AND";
                    }
                    $demand=substr($demand,0,-3);
                    $sql="SELECT * FROM ".$this->table." where ".$demand;
                    return $this->return($sql,__FUNCTION__);
                }
            }
    ?>