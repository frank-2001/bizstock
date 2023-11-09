<?php

                if (isset($_GET[$mouvements->table."-all"])) {
                    $output=$mouvements->All();
                }
                if (isset($_GET[$mouvements->table."-new"])) {
                    $mse=$marchandises->by(["libele"=>$_POST["marchandise"]])["data"][0];
                    if ($mse["stock"]-$_POST["quantite"]>=0) {
                        $marchandises->update2("libele='".$_POST["marchandise"]."'",["stock"=>$mse["stock"]-$_POST["quantite"]]);
                        $output=$mouvements->new($_POST);
                    }else{
                        $output="erreur";
                    }
                    
                    
                }
                if (isset($_GET[$mouvements->table."-byId"])) {
                    $output=$mouvements->byId($_GET[$mouvements->table."-byId"]);
                }
                if (isset($_GET[$mouvements->table."-update"])) {
                    $output=$mouvements->update($_GET[$mouvements->table."-update"],$_POST);
                }
                if (isset($_GET[$mouvements->table."-delete"])) {
                    $output=$mouvements->delete($_POST);
                }
                if (isset($_GET[$mouvements->table."-search"])) {
                    $output=$mouvements->search($_POST);
                }
                if (isset($_GET[$mouvements->table."-by"])) {
                    $output=$mouvements->by($_POST);
                }
            