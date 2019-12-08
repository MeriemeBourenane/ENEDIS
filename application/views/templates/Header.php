<html>

    <head>
        <!-- Start  meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <!-- End meta-->

        <!--Start Link -->
        <link href="<?php echo base_url("assets/bootstrap/css/bootstrap.css"); ?>" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link rel="stylesheet" href="<?php echo base_url("assets/CSS/style.css"); ?>" />
        <link rel="stylesheet" href="<?php echo base_url("assets/CSS/header.css"); ?>" />
        <link rel="stylesheet" href="<?php echo base_url("assets/CSS/footer.css"); ?>" />
        <link rel="stylesheet" href="<?php echo base_url("assets/CSS/list-vehicule.css"); ?>" />
        
        <!-- ICI IL FAUT METTRE TOUS LES LIENS VERS LES FICHIERS CSS OU AUTRES CAR CET HEADER SERA LOAD PARTOUT -->
        
        <!--End link -->

    </head>

    <body>

    <header class="shadow">
        <div class="header-menu">
            <!-- start header Logo and profil -->
            <nav class="navbar navbar-expand-lg navar-custom">
                <div class="enTete1">
                    <a class="navbar-brand logoENEDIS" href="#">
                        <img src="<?php echo base_url("assets/images/enedis_logo.svg"); ?>" width="300" height="95" alt="">
                    </a>

                    <div class="dropdown">
                        <div class="d-none d-lg-inline-block" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="cercle-user">
                                <i class="fas fa-user-tie header-user"></i>
                            </div>
                        </div>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">

                            <a class="dropdown-item" href="#">Mon profil</a>
                            <a class="dropdown-item" href="#">Se déconnecter</a>
                        </div>
                    </div>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">

                        <a class="dropdown-item" href="#">Mon profil</a>
                        <a class="dropdown-item" href="#">Se déconnecter</a>
                    </div>

                </div>
            </nav>
            <div class='d-flex d-lg-none justify-content-end align-item-center'>
                <button class="navbar-toggler" type="button btn-burger" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars icon-menu-bar"></i>
                </button>
            </div>

        </div>
        <!-- End header Logo and profil -->

        <!-- Start header menuBar -->
        <nav class="navbar navbar-expand-lg navar-custom">
            <div class=" menuBar">

                <ul class="navbar-nav nav-list  d-none d-lg-flex">
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="<?php echo site_url("Listing_vehicule/listing_vehicule"); ?>"><i class="fas fa-car"></i> Réservation de véhicule <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="<?php echo site_url("Suivi_demandes/suivi_demandes"); ?>"><i class="fas fa-chart-bar"></i> Suivi de mes demandes <span class="sr-only">(current)</span></a>
                    </li>
                </ul>


            </div>

        </nav>

        <!-- End header menuBar -->
        <div class="collapse navbar-collapse  d-lg-none " id="navbarNav">
            <ul class="navbar-nav nav-list p-3">
                <li class="nav-item active">
                <a class="nav-link text-white" href="../list-vehicules/view_list-vehicule.php"><i class="fas fa-car"></i> Réservation de véhicule <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                <a class="nav-link text-white" href="#"><i class="fas fa-chart-bar"></i> Suivi de mes demandes <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                <a class="nav-link text-white" href="../list-vehicules/view_list-vehicule.php"><i class="fas fa-user-tie"></i> Mon Profil <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                <a class="nav-link text-white" href="#"><i class="fas fa-sign-out-alt"></i> Se déconnecter <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>

    </header>
    <!--End HEADER -->