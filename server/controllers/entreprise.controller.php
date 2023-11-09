<?php

                if (isset($_GET[$entreprise->table."-all"])) {
                    $output=$entreprise->All();
                }
                if (isset($_GET[$entreprise->table."-new"])) {
                    $output=$entreprise->new($_POST);
                }
                if (isset($_GET[$entreprise->table."-byId"])) {
                    $output=$entreprise->byId($_GET[$entreprise->table."-byId"]);
                }
                if (isset($_GET[$entreprise->table."-update"])) {
                    $output=$entreprise->update($_GET[$entreprise->table."-update"],$_POST);
                }
                if (isset($_GET[$entreprise->table."-delete"])) {
                    $output=$entreprise->delete($_POST);
                }
                if (isset($_GET[$entreprise->table."-search"])) {
                    $output=$entreprise->search($_POST);
                }
                if (isset($_GET[$entreprise->table."-by"])) {
                    $output=$entreprise->by($_POST);
                }
            