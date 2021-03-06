/*
 * Copyright 2014 JBoss Inc
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.artificer.events;

import org.artificer.common.ontology.ArtificerOntology;

/**
 * @author Brett Meyer
 */
public class OntologyUpdateEvent {
    
    private ArtificerOntology updatedOntology = null;
    
    private ArtificerOntology oldOntology = null;
    
    public OntologyUpdateEvent() {
    }
    
    public OntologyUpdateEvent(ArtificerOntology updatedOntology, ArtificerOntology oldOntology) {
        this.updatedOntology = updatedOntology;
        this.oldOntology = oldOntology;
    }

    /**
     * @return the updatedOntology
     */
    public ArtificerOntology getUpdatedOntology() {
        return updatedOntology;
    }

    /**
     * @param updatedOntology the updatedOntology to set
     */
    public void setUpdatedOntology(ArtificerOntology updatedOntology) {
        this.updatedOntology = updatedOntology;
    }

    /**
     * @return the oldOntology
     */
    public ArtificerOntology getOldOntology() {
        return oldOntology;
    }

    /**
     * @param oldOntology the oldOntology to set
     */
    public void setOldOntology(ArtificerOntology oldOntology) {
        this.oldOntology = oldOntology;
    }

}
