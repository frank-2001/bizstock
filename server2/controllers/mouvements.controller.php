<?php

                if (isset($_GET[$mouvements->table."-all"])) {
                    $output=$mouvements->All();
                }
                if (isset($_GET[$mouvements->table."-new"])) {
                    $mse=$stock_succursale->by(["id"=>$_POST["id_marchandise"]])["data"][0];
                    if ($mse["quantite"]-$_POST["quantite"]>=0) {
                        $stock_succursale->update(["id"=>$_POST["id_marchandise"]],["quantite"=>$mse["quantite"]-$_POST["quantite"]]);
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
            