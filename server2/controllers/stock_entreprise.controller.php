<?php

                if (isset($_GET[$stock_entreprise->table."-all"])) {
                    $output=$stock_entreprise->All();
                }
                if (isset($_GET[$stock_entreprise->table."-new"])) {
                    $output=$stock_entreprise->new($_POST);
                }
                if (isset($_GET[$stock_entreprise->table."-byId"])) {
                    $output=$stock_entreprise->byId($_GET[$stock_entreprise->table."-byId"]);
                }
                if (isset($_GET[$stock_entreprise->table."-update"])) {
                    $output=$stock_entreprise->update($_GET,$_POST);
                }
                if (isset($_GET[$stock_entreprise->table."-delete"])) {
                    $output=$stock_entreprise->delete($_POST);
                }
                if (isset($_GET[$stock_entreprise->table."-search"])) {
                    $output=$stock_entreprise->search($_POST);
                }
                if (isset($_GET[$stock_entreprise->table."-by"])) {
                    $output=$stock_entreprise->by($_POST);
                }
            