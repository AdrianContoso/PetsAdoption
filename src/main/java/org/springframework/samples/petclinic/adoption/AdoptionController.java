package org.springframework.samples.petclinic.adoption;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdoptionController {

	private final AdoptablePetRepository adoptablePetRepository;

	public AdoptionController(AdoptablePetRepository adoptablePetRepository) {
		this.adoptablePetRepository = adoptablePetRepository;
	}

	@GetMapping("/adoption")
	public String showAdoptionPage(Model model) {
		model.addAttribute("adoptablePets", adoptablePetRepository.findAll());
		return "adoption/adoptionList";
	}

	@PostMapping("/adoption/{petId}/adopt")
	public String adoptPet(@PathVariable("petId") int petId, RedirectAttributes redirectAttributes) {
		AdoptablePet pet = adoptablePetRepository.findById(petId).orElseThrow();
		pet.setAdopted(true);
		adoptablePetRepository.save(pet);
		redirectAttributes.addFlashAttribute("message", "Thank you for adopting this pet!");
		return "redirect:/adoption";
	}

}
