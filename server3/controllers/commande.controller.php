<?php

                if (isset($_GET[$commande->table."-all"])) {
                    $output=$commande->All();
                }
                if (isset($_GET[$commande->table."-new"])) {
                    $output=$commande->new($_POST);
                }
                if (isset($_GET[$commande->table."-byId"])) {
                    $output=$commande->byId($_GET[$commande->table."-byId"]);
                }
                if (isset($_GET[$commande->table."-update"])) {
                    $output=$commande->update($_GET[$commande->table."-update"],$_POST);
                }
                if (isset($_GET[$commande->table."-delete"])) {
                    $output=$commande->delete($_POST);
                }
                if (isset($_GET[$commande->table."-search"])) {
                    $output=$commande->search($_POST);
                }
                if (isset($_GET[$commande->table."-by"])) {
                    $output=$commande->by($_POST);
                }
            