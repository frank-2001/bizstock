<?php

                if (isset($_GET[$marchandises->table."-all"])) {
                    $output=$marchandises->All();
                }
                if (isset($_GET[$marchandises->table."-new"])) {
                    $output=$marchandises->new($_POST);
                }
                if (isset($_GET[$marchandises->table."-byId"])) {
                    $output=$marchandises->byId($_GET[$marchandises->table."-byId"]);
                }
                if (isset($_GET[$marchandises->table."-update"])) {
                    $output=$marchandises->update($_GET[$marchandises->table."-update"],$_POST);
                }
                if (isset($_GET[$marchandises->table."-delete"])) {
                    $output=$marchandises->delete($_POST);
                }
                if (isset($_GET[$marchandises->table."-search"])) {
                    $output=$marchandises->search($_POST);
                }
                if (isset($_GET[$marchandises->table."-by"])) {
                    $output=$marchandises->by($_POST);
                }
            