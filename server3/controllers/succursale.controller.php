<?php

                if (isset($_GET[$succursale->table."-all"])) {
                    $output=$succursale->All();
                }
                if (isset($_GET[$succursale->table."-new"])) {
                    $output=$succursale->new($_POST);
                }
                if (isset($_GET[$succursale->table."-byId"])) {
                    $output=$succursale->byId($_GET[$succursale->table."-byId"]);
                }
                if (isset($_GET[$succursale->table."-update"])) {
                    $output=$succursale->update($_GET[$succursale->table."-update"],$_POST);
                }
                if (isset($_GET[$succursale->table."-delete"])) {
                    $output=$succursale->delete($_POST);
                }
                if (isset($_GET[$succursale->table."-search"])) {
                    $output=$succursale->search($_POST);
                }
                if (isset($_GET[$succursale->table."-by"])) {
                    $output=$succursale->by($_POST);
                }
            