package org.springframework.samples.petclinic.adoption;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdoptablePetRepository extends JpaRepository<AdoptablePet, Integer> {

}
