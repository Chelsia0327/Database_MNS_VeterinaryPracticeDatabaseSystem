**Pets First - Veterinary Practice Database System**

*Introduction*

Pets First has a number of clinics distributed across the suburbs. For each clinic they record the clinic's id (which is used to identify the clinic), the clinic's name, its
address and the clinic's contact phone number. The practice has a number of veterinary surgeons (vets) who work in these clinics, a vet is assigned to one clinic as their home (or base) clinic. To be able to function, a clinic must have at least one
vet assigned to it as the vets base clinic. 

The details Pets First record about a vet are their vet id (used to identify a vet), the vet's given name and family name, the vet's contact phone number and the date they were first employed by Pets First.

Some of Pets First vets are specialists in areas such as oncology, cardiology, dermatology etc. These specialist vets, as well as having a home clinic (their base clinic) where they accept general visits, also rove around all clinics when their specialist skills are required in the treatment of an animal. In addition these specialist
vets visit clinics to provide training to the clinic based vets. Pets First wishes to know which clinic a particular specialist vet has provided training at, what the training course was called (eg. Heart Scanning), what date the training was provided and its
duration. A given training session is only run by a single specialist at a single clinic. 

If the vet is a specialist vet then their area of specialisation is also recorded as part of their vet details (specialist vets only specialise in one particular area). 

Each clinic appoints one of the vets based in the clinic (i.e. those vets assigned to the clinic as their home clinic) as the head vet for that clinic. 

Pet owners, who are each assigned a unique owner id, have their given name and family name recorded by the practice. The practice also records the owner's contact
phone number. Each owner may have one or more pets; for each pet the practice records a unique animal id, the animal's name, the year the animal was born and the type of animal they are, for example a cat. Each animal is only recorded as being
owned by one owner.

When an animal needs veterinary attention (such as annual injections) or is ill, the owner brings their pet to one of the practice's clinics to be attended to by a vet - this is called a visit. The date and time of the visit, the clinic being visited and the
attending vet are recorded (this attending vet may be one based at this particular clinic ie. this is their home clinic, or the visit may need the services of a roving specialist vet). In addition, the practice records the weight of the pet for this visit, the
length of the visit and any notes that the vet needs to make about the condition of the pet.

Some visits require further follow up visits, the system needs to record, for these subsequent visits, which visit generated the follow up. A given visit may require
multiple follow up visits to address an issue identified in the initial diagnosis. For example the pet may have an infected wound from a fight. The first visit for this issue
results in antibiotics being given and the wound being stitched. Follow up visits may be required for example to remove the stitches, check the wound healing, provide
further antibiotic injections etc.

During a visit the attending vet may need to prescribe drugs for the animal. The practice identifies a drug by a unique drug id, and also records the drug's name and the drugs usage instructions (for example "1 ml/3Kg of body weight given once or twice a day"). When a drug is prescribed during a visit, the actual drug dose and frequency of administration are recorded.




**My Role**
*Data Analyst*

•    Designed and implemented 3NF database schemas in Oracle RDBMS based on in-depth business requirement analysis for a multi-clinic veterinary logics (Tiered Dental Billing, Prescription Mgmt, Staff Training etc)

•    Performed "live" database alterations to support evolving requirements via sophisticated DML transactions, such as multi-emergency contact registration, without compromising data integrity.

•    Acted as a core member of a 3-person team, supporting full-lifecycle iterative schema updates using Git with zero-conflict collaboration; project ranked Top 5% (HD).

