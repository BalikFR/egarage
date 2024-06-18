<?php

use PHPUnit\Framework\TestCase;
use App\Patient;

class PatientTest extends TestCase {
    public function testSetName() {
        $client = new Patient();
        $client->setName("John Doe");
        $this->assertEquals("John Doe", $client->getName());
    }

    // Ajoutez ici d'autres tests pour les méthodes de la classe Patient si nécessaire
}
