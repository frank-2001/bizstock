<?php

                if (isset($_GET[$facture->table."-all"])) {
                    $output=$facture->All();
                    for ($i=0; $i < count($output["data"]); $i++) { 
                        $output["data"][$i]["marchandises"]=$mouvements->by(["facture"=>$output["data"][$i]["id"]])["data"];
                    }
                }
                if (isset($_GET[$facture->table."-new"])) {
                    $output=$facture->new($_POST);
                }
                if (isset($_GET[$facture->table."-byId"])) {
                    $output=$facture->byId($_GET[$facture->table."-byId"]);
                }
                if (isset($_GET[$facture->table."-update"])) {
                    $output=$facture->update($_GET[$facture->table."-update"],$_POST);
                }
                if (isset($_GET[$facture->table."-delete"])) {
                    $output=$facture->delete($_POST);
                }
                if (isset($_GET[$facture->table."-search"])) {
                    $output=$facture->search($_POST);
                }
                if (isset($_GET[$facture->table."-by"])) {
                    $output=$facture->by($_POST);
                    for ($i=0; $i < count($output["data"]); $i++) { 
                        $output["data"][$i]["marchandises"]=$mouvements->by(["facture"=>$output["data"][$i]["id"]])["data"];
                    }
                }
            