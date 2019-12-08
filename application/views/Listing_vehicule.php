    <!--Start list cars -->
    <div class='container-fluid p-4'>
        <div class='row'>
            <div class="col-12 mb-3">
                <h1 class="text-align title-page">Réservation de véhicule</h1>

                <form class="form-inline" method="POST" action="listing_vehicule">

                    <div class="form-group filter-bar-vehicule">
                        <label class="mr-3" for="filter-by-disponibilities">Filtrer par : </label>
                        <select class="form-control input-enedis-green" name="filter-by-disponibilities">
                            <option value="">---- Choisir un filtre ----</option>
                            <option value="all">Tous les véhicules</option>
                            <option value="1">Véhicule(s) disponible(s)</option>
                            <option value="2">Véhicule(s) indisponible(s)</option>
                        </select>
                    </div>

                    <!-- Boucle pour afficher tous les types de véhicules de la BDD -->
                    <div class="form-group filter-bar-vehicule">
                        <label class="mr-3 ml-3" for="filter-by-type">Filtrer par : </label>
                        <select class="form-control input-enedis-green" name="filter-by-type">
                            <option value="">---- Choisir un type de véhicule ----</option>
                            <option value="all">Tous les types</option>

                            <?php 
                            foreach ($types_vehicules as $indice => $champs)
                            {
                            ?>
                                <option value=<?php echo $champs['id_type'];?>> <?php echo $champs['libelle'];?> </option>
                            <?php
                            }
                            ?>
                        </select>
                    </div>


                    <button type="submit" class="ml-2 btn btn-tri btn-enedis-blue" name="tri">
                        Filtrer <i class="fas fa-filter"></i>
                    </button>
                    
                </form>
            </div>


            <!--Start card cars -->
            <div class='col-lg-3 col-md-6 col-12 mb-4'>
                <div class="card card-cars">
                    <div class="p-3 bg-cars">
                        <img src="../../assets/images/cars/clio.jpg" class="card-img-top" alt="...">
                    </div>
                    <div class="border-top pt-2">
                        <div class="card-body">
                            <h5 class="card-title cars-title text-center">Clio tunée de la mort qui tue</h5>
                        </div>
                    </div>
                </div>
            </div>
            <!--End card cars -->
            <!--Start card cars -->
            <div class='col-lg-3 col-md-6 col-12 mb-4'>
                <div class="card card-cars">
                    <div class="p-3 bg-cars">
                        <img src="../../assets/images/cars/clio.jpg" class="card-img-top" alt="...">
                    </div>
                    <div class="border-top pt-2">
                        <div class="card-body">
                            <h5 class="card-title cars-title text-center">Clio tunée de la mort qui tue</h5>
                        </div>
                    </div>
                </div>
            </div>
            <!--End card cars -->
            <!--Start card cars -->
            <div class='col-lg-3 col-md-6 col-12 mb-4'>
                <div class="card card-cars">
                    <div class="p-3 bg-cars">
                        <img src="../../assets/images/cars/clio.jpg" class="card-img-top" alt="...">
                    </div>
                    <div class="border-top pt-2">
                        <div class="card-body">
                            <h5 class="card-title cars-title text-center">Clio tunée de la mort qui tue</h5>
                        </div>
                    </div>
                </div>
            </div>
            <!--End card cars -->


        </div>
    </div>
    <!--End list cars -->
    
<?php echo var_dump($types_vehicules); ?>