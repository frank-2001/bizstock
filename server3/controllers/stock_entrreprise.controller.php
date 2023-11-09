<?php

                if (isset($_GET[$stock_entrreprise->table."-all"])) {
                    $output=$stock_entrreprise->All();
                }
                if (isset($_GET[$stock_entrreprise->table."-new"])) {
                    $output=$stock_entrreprise->new($_POST);
                }
                if (isset($_GET[$stock_entrreprise->table."-byId"])) {
                    $output=$stock_entrreprise->byId($_GET[$stock_entrreprise->table."-byId"]);
                }
                if (isset($_GET[$stock_entrreprise->table."-update"])) {
                    $output=$stock_entrreprise->update($_GET,$_POST);
                }
                if (isset($_GET[$stock_entrreprise->table."-delete"])) {
                    $output=$stock_entrreprise->delete($_POST);
                }
                if (isset($_GET[$stock_entrreprise->table."-search"])) {
                    $output=$stock_entrreprise->search($_POST);
                }
                if (isset($_GET[$stock_entrreprise->table."-by"])) {
                    $output=$stock_entrreprise->by($_POST);
                }
            