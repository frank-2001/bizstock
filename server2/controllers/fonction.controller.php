<?php

                if (isset($_GET[$fonction->table."-all"])) {
                    $output=$fonction->All();
                }
                if (isset($_GET[$fonction->table."-new"])) {
                    $output=$fonction->new($_POST);
                }
                if (isset($_GET[$fonction->table."-byId"])) {
                    $output=$fonction->byId($_GET[$fonction->table."-byId"]);
                }
                if (isset($_GET[$fonction->table."-update"])) {
                    $output=$fonction->update($_GET[$fonction->table."-update"],$_POST);
                }
                if (isset($_GET[$fonction->table."-delete"])) {
                    $output=$fonction->delete($_POST);
                }
                if (isset($_GET[$fonction->table."-search"])) {
                    $output=$fonction->search($_POST);
                }
                if (isset($_GET[$fonction->table."-by"])) {
                    $output=$fonction->by($_POST);
                }
            