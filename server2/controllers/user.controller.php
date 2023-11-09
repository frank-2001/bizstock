<?php

                if (isset($_GET[$user->table."-all"])) {
                    $output=$user->All();
                }
                if (isset($_GET[$user->table."-new"])) {
                    $output=$user->new($_POST);
                }
                if (isset($_GET[$user->table."-byId"])) {
                    $output=$user->byId($_GET[$user->table."-byId"]);
                }
                if (isset($_GET[$user->table."-update"])) {
                    $output=$user->update($_GET,$_POST);
                }
                if (isset($_GET[$user->table."-delete"])) {
                    $output=$user->delete($_POST);
                }
                if (isset($_GET[$user->table."-search"])) {
                    $output=$user->search($_POST);
                }
                if (isset($_GET[$user->table."-by"])) {
                    $output=$user->by($_POST);
                }
            