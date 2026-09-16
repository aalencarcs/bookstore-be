CREATE TABLE IF NOT EXISTS book (
                                    id BIGSERIAL PRIMARY KEY,
                                    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    genre VARCHAR(255),
    difficulty VARCHAR(50)
    );

CREATE TABLE IF NOT EXISTS consequence (
                                           id BIGSERIAL PRIMARY KEY,
                                           type VARCHAR(50) NOT NULL,
    value INT,
    text VARCHAR(1000)
    );

CREATE TABLE IF NOT EXISTS section (
                                       id INT PRIMARY KEY,
                                       book_id BIGINT NOT NULL,
                                       text VARCHAR(4000),
    type VARCHAR(50) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES book(id)
    );

CREATE TABLE IF NOT EXISTS story_option (
                                            id BIGSERIAL PRIMARY KEY,
                                            section_id INT NOT NULL,
                                            description VARCHAR(500),
    goto_id INT,
    consequence_id BIGINT,
    FOREIGN KEY (section_id) REFERENCES section(id),
    FOREIGN KEY (consequence_id) REFERENCES consequence(id)
    );

INSERT INTO book (id, title, author, difficulty, genre)
VALUES (1, 'Pirates of the Jade Sea', 'Marina Blackwood', 'MEDIUM', 'Fantasy'),
       (2, 'The Prisoner', 'Daniel El Fuego', 'HARD', 'Comedy'),
       (3, 'The Crystal Caverns', 'Evelyn Stormrider', 'EASY', 'Adventure'),
       (4, 'The Fog on Vesper Street', 'Constance Ryerson', 'MEDIUM', 'Noir');

INSERT INTO consequence (id, type, value, text)
VALUES (1, 'LOSE_HEALTH', 3, 'The pirate lunges at you with a hidden dagger before the guards subdue him.'),
       (2, 'LOSE_HEALTH', 5, 'A rogue wave crashes onto the deck, injuring several crew members.'),
       (3, 'LOSE_HEALTH', 7, 'A swirling current drags you under before the crew hauls you back aboard.'),
       (4, 'LOSE_HEALTH', 4, 'Splinters cut your hands as you force the chest open.'),
       (5, 'LOSE_HEALTH', 6, 'A rock grazes your shoulder as you narrowly escape.'),
       (6, 'LOSE_HEALTH', 1, 'The delay costs you a minor opportunity.'),
       (7, 'LOSE_HEALTH', 6, 'As you move your hands left and right under the bed, you cut yourself on a rusty nail.'),
       (8, 'LOSE_HEALTH', 3, 'You''re getting a little more crazier...'),
       (9, 'LOSE_HEALTH', 4, 'You scrape your shoulder squeezing through the narrow gap.'),
       (10, 'LOSE_HEALTH', 7, 'You land hard and twist your ankle.'),
       (11, 'GAIN_HEALTH', 3, 'You feel slightly better after resting.'),
       (12, 'LOSE_HEALTH', 5, 'The freezing water chills you to the bone.'),
       (13, 'LOSE_HEALTH', 5, 'The man has a knife. It cuts your arm before he jumps over a fence and runs off.'),
       (14, 'LOSE_HEALTH', 3, 'He pushes you into some crates and walks away without answering.'),
       (15, 'LOSE_HEALTH', 4, 'He sees you and slams a drawer on your fingers. Then he runs past you.'),
       (16, 'LOSE_HEALTH', 6, 'He fights back hard and hits you in the ribs before you stop him.'),
       (17, 'GAIN_HEALTH', 3, 'You take a moment to calm down first. It helps you feel ready.'),
       (18, 'LOSE_HEALTH', 4, 'A splinter from the old floorboards jabs into your palm.'),
       (19, 'LOSE_HEALTH', 5, 'The narrow passage collapses slightly, scraping your back as you squeeze through.'),
       (20, 'LOSE_HEALTH', 3, 'You tackle him blindly and land a hard punch, but he elbows you before you pin him down.'),
       (21, 'LOSE_HEALTH', 2, 'He panics and shoves you against the wall before blurting out everything anyway.'),
       (22, 'LOSE_HEALTH', 2, 'Duke grows irritated and shoves past you, but a nearby clerk whispers about the mistress instead.');

INSERT INTO section (id, book_id, text, type)
VALUES (1, 1,
        'The salty breeze carries the cries of distant gulls as your ship sails across the shimmering Jade Sea. Rumors speak of hidden treasure on the Isle of Serpents.',
        'BEGIN'),
       (20, 1, 'The captured pirate snarls but whispers about a secret cove guarded by a sea monster.', 'NODE'),
       (100, 1, 'You steer toward the mysterious Isle of Serpents. As you approach, dark storm clouds gather overhead.',
        'NODE'),
       (200, 1,
        'Shaken, the pirate reveals that the sea monster can be lulled to sleep by an enchanted conch shell hidden deep within a wrecked galleon.',
        'NODE'),
       (300, 1, 'The storm rages violently. Lightning flashes illuminate shadowy shapes beneath the waves.', 'NODE'),
       (400, 1, 'After hours of waiting, the storm clears and the Isle of Serpents looms ahead, shrouded in mist.',
        'NODE'),
       (500, 1,
        'You find the wrecked galleon resting on a coral reef. The conch shell glows faintly within a locked chest.',
        'NODE'),
       (600, 1, 'Beneath the waves, you glimpse the massive serpent coiled around a treasure-laden wreck.', 'NODE'),
       (700, 1, 'The storm subsides. Your ship drifts into calm waters, and the sun breaks through the clouds.',
        'NODE'),
       (800, 1, 'You step onto the white sands of the Isle of Serpents. Ancient ruins rise above the jungle canopy.',
        'NODE'),
       (900, 1, 'Inside the chest, you find the enchanted conch shell. Its surface hums softly with power.', 'NODE'),
       (1000, 1, 'The chest bursts open, revealing the glowing conch shell.', 'NODE'),
       (1200, 1, 'Inside the ruins, you discover a chamber filled with gold and jewels, but a trap triggers!', 'NODE'),
       (1300, 1, 'From the top of the ruins, you spot a hidden lagoon surrounded by jagged cliffs.', 'NODE'),
       (1400, 1, 'You reach a secret pirate hideout filled with treasure. The crew celebrates your discovery.', 'END'),
       (1500, 1, 'Breathing heavily, you escape the collapsing ruins with your life intact.', 'END'),
       (666, 1, 'You face a dangerous choice.', 'NODE'),
       (999, 1, 'The pirate reveals a shocking secret about the hidden treasure location. You now have a crucial choice to make.', 'NODE'),

       (2001, 2, 'You wake up in what seems to be a dark prison cell, on an old wooden bed. Metal bars are preventing you to escape from the room. There is no window.', 'BEGIN'),
       (2020, 2, 'You don''t see anything, it''s too dark.', 'NODE'),
       (2030, 2, 'You found what seems to be a door key.', 'NODE'),
       (2500, 2, 'The door is locked.', 'NODE'),
       (3000, 2, 'The door opens. You are now free...', 'END'),
       (2666, 2, 'Your fingers brush against a loose floorboard in the corner.', 'NODE'),

       (4001, 3, 'You stand at the entrance of the legendary Crystal Caverns. A cold breeze carries whispers from the darkness below. A broken rope bridge leads into the depths.', 'BEGIN'),
       (4020, 3, 'Your hands brush against the cold stone until you find a hidden crevice leading downward. It''s dark, but you hear faint dripping water.', 'NODE'),
       (4100, 3, 'The bridge creaks under your weight. Halfway across, a plank snaps beneath your foot!', 'NODE'),
       (4200, 3, 'You emerge into a glittering chamber filled with glowing crystals. At the center lies a pedestal holding an ancient gemstone.', 'NODE'),
       (4300, 3, 'You crawl to safety on the other side, breathing heavily. A winding path descends deeper into the cavern.', 'NODE'),
       (4400, 3, 'You barely make the jump, but the rope bridge collapses behind you. There''s no turning back now.', 'NODE'),
       (4500, 3, 'The moment you touch the gemstone, the chamber begins to shake violently. A secret door opens to reveal a hidden passage.', 'NODE'),
       (4600, 3, 'You reach a vast underground lake glowing with bioluminescent crystals. A small boat waits at the shore.', 'NODE'),
       (4700, 3, 'After a short rest, you feel strong enough to continue your journey.', 'NODE'),
       (4800, 3, 'The hidden passage leads to a giant crystal throne room, where an ancient spirit awaits.', 'END'),
       (4900, 3, 'The boat carries you safely across, but you sense something massive moving in the depths below.', 'NODE'),
       (5000, 3, 'You manage to swim across, shivering but alive. The glowing crystals ahead light your way to a massive door.', 'END'),
       (4666, 3, 'An unreachable dead end. You shouldn''t be here.', 'NODE'),

       (8001, 4, 'Rain falls on Vesper Street. You kneel next to the body of Aldous Crane, a rich ship owner. He has one stab wound. Thick fog hides the streetlights. Somewhere close, you hear footsteps walking away.', 'BEGIN'),
       (8020, 4, 'A ticket falls out of his coat. It says Pier 7, midnight boat. You also find a matchbook from the Blue Canary bar.', 'NODE'),
       (8100, 4, 'You run into the fog. You see a shadow move into an alley. You follow it without thinking.', 'NODE'),
       (8200, 4, 'The Blue Canary is quiet and full of smoke. The bartender knows the matchbook. It belongs to a regular customer named Vic Marlowe. He has not come in for days.', 'NODE'),
       (8300, 4, 'Pier 7 is empty. A night guard is there. He says no boat left tonight. The midnight boat was cancelled weeks ago.', 'NODE'),
       (8400, 4, 'You stop to catch your breath in the alley. On the ground you see a small pin. It belongs to the Dockworkers Guild.', 'NODE'),
       (8500, 4, 'An address leads you to a small apartment. Vic Marlowe is there, packing a bag fast. He looks nervous and is sweating.', 'NODE'),
       (8600, 4, 'At the Guild hall, people point you to a foreman named Duke Halloway. He was heard threatening Crane about unpaid money just days ago.', 'NODE'),
       (8700, 4, 'Marlowe finally talks. Crane was blackmailing him over gambling debts. He swears he did not kill Crane. He says he saw a woman in a green coat leaving Crane''s office that night.', 'NODE'),
       (8800, 4, 'Under some letters, you find threats written to Crane. They are signed only ''D.H.''. You also find a torn photo of a woman in a green coat.', 'NODE'),
       (8900, 4, 'Duke Halloway is at his dock office. He is not surprised to see you. He says, ''Crane hurt many families here. But murder is not my way. Ask his mistress. She had a better reason than any of us.''', 'NODE'),
       (9000, 4, 'The mistress wears a green coat. Her eyes are red from crying. She says, ''Crane was going to leave me with nothing once he changed his will. I went to talk to him. I did not kill him. But I know who did: his business partner, Simon Ashgrove. He came in right after I left.''', 'NODE'),
       (9100, 4, 'You walk straight into Ashgrove''s office. He is surprised and grabs a letter opener. You fight to take it from his hand.', 'NODE'),
       (9200, 4, 'You look through the shipping records. You find that Ashgrove was about to be caught stealing company money. This gives him a reason to kill Crane. You now have enough proof to face him calmly.', 'NODE'),
       (9300, 4, 'You show Ashgrove the records. He gives up and confesses. The fog over Vesper Street finally clears. The police take him away. You are safe and the case is closed.', 'END'),
       (9400, 4, 'Ashgrove confesses through gritted teeth, holding his hurt hand. The case is closed, but you will remember Vesper Street for a long time.', 'END'),
       (8650, 4, 'Dockworkers grumble about the ship owner''s greed. One mentions a scandal about Crane''s mistress.', 'NODE');

INSERT INTO story_option (section_id, description, goto_id, consequence_id)
VALUES (1, 'Take the helm and steer toward the Isle of Serpents', 666, NULL),
       (1, 'Interrogate the captured pirate in the brig', 999, NULL),

       (20, 'Threaten him for more information', 200, 1),
       (20, 'Leave him and return to the deck', 1, NULL),

       (100, 'Sail through the storm', 300, NULL),
       (100, 'Drop anchor and wait for the storm to pass', 400, 2),

       (200, 'Search for the wrecked galleon', 500, NULL),
       (200, 'Ignore the legend and continue to the island', 100, NULL),

       (300, 'Dive into the water to investigate', 600, 3),
       (300, 'Stay on deck and brace for impact', 700, NULL),

       (400, 'Explore the island', 800, NULL),

       (500, 'Unlock the chest carefully', 900, NULL),
       (500, 'Smash the chest open', 1000, 4),

       (600, 'Swim closer to investigate', 666, NULL),
       (600, 'Retreat back to the surface', 300, NULL),

       (700, 'Set a course for the Isle of Serpents', 800, NULL),

       (800, 'Search the ruins for treasure', 1200, NULL),
       (800, 'Climb the tallest ruin for a better view', 1300, NULL),

       (900, 'Blow the conch to summon help', 1400, NULL),
       (900, 'Keep it safe for later', 800, NULL),

       (1000, 'Take the shell', 900, NULL),

       (1200, 'Dodge the falling stones', 1500, 5),
       (1200, 'Grab the treasure and run', 1400, NULL),

       (1300, 'Head toward the hidden lagoon', 1400, NULL),

       (666, 'Push forward into the storm', 1200, NULL),
       (666, 'Retreat to the harbor', 300, NULL),

       (999, 'Trust the pirate''s directions and sail immediately', 1200, NULL),
       (999, 'Report the pirate to the captain first', 1300, 6),
       (999, 'Ignore the pirate and continue your own quest', 900, NULL),

       (2001, 'You try to open the door', 2500, NULL),
       (2001, 'You look under the bed', 2020, NULL),
       (2020, 'Try to scan the area with your hands', 2030, 7),
       (2020, 'Pry up the loose floorboard', 2666, 18),
       (2030, 'Try to open the door with the key', 3000, NULL),
       (2500, 'Gather your thoughts', 2001, 8),
       (2666, 'Reach into the gap beneath the floorboard', 2030, NULL),

       (4001, 'Cross the rope bridge carefully', 4100, NULL),
       (4001, 'Search the rocky walls for another path', 4020, NULL),
       (4020, 'Enter the crevice', 4200, 9),
       (4020, 'Return to the entrance', 4001, NULL),
       (4100, 'Hold on tightly and crawl across', 4300, NULL),
       (4100, 'Try to jump to the other side', 4400, 10),
       (4200, 'Take the gemstone', 4500, NULL),
       (4200, 'Inspect the walls carefully', 4600, NULL),
       (4300, 'Follow the path downward', 4600, NULL),
       (4300, 'Rest and recover your strength', 4700, 11),
       (4400, 'Continue deeper into the cavern', 4600, NULL),
       (4500, 'Enter the hidden passage', 4800, NULL),
       (4500, 'Drop the gemstone and run back', 4200, NULL),
       (4600, 'Take the boat across the lake', 4900, NULL),
       (4600, 'Swim across', 5000, 12),
       (4700, 'Head toward the underground lake', 4600, NULL),
       (4900, 'Ignore it and continue forward', 4800, NULL),
       (4900, 'Investigate the movement', 4666, NULL),
       (4666, 'Turn back before it is too late', 4600, 19),

       (8001, 'Look at the body for clues', 8020, NULL),
       (8001, 'Chase the footsteps', 8100, NULL),

       (8020, 'Go to the Blue Canary bar', 8200, NULL),
       (8020, 'Go check Pier 7', 8300, NULL),

       (8100, 'Corner the person', 8400, 13),
       (8100, 'Grab the shadow before it can react', 8400, 20),

       (8200, 'Ask for Vic Marlowe''s address', 8500, NULL),
       (8200, 'Show Crane''s photo to the bartender', 8600, NULL),

       (8300, 'Ask the guard who wanted the fake ticket', 8500, 14),
       (8300, 'Search the pier for tracks', 8400, NULL),

       (8400, 'Take the pin to the Dockworkers Guild', 8600, NULL),
       (8400, 'Pocket the pin and head straight to Marlowe''s apartment', 8500, NULL),

       (8500, 'Talk to him directly', 8700, NULL),
       (8500, 'Search his room while he is busy', 8800, 15),

       (8600, 'Go find Duke Halloway', 8900, NULL),
       (8600, 'Ask around the docks for more rumors first', 8650, NULL),

       (8650, 'Go find Duke Halloway', 8900, NULL),
       (8650, 'Head back to the Blue Canary instead', 8200, NULL),

       (8700, 'Ask who the woman in green was', 9000, NULL),
       (8700, 'Threaten him for the full story', 9000, 21),

       (8800, 'Follow the initials to the docks', 8900, NULL),
       (8800, 'Slip out quietly before anyone notices', 8900, NULL),

       (8900, 'Go find Crane''s mistress', 9000, NULL),
       (8900, 'Push him about his own alibi', 9000, 22),

       (9000, 'Confront Simon Ashgrove right away', 9100, NULL),
       (9000, 'Gather more proof first', 9200, NULL),

       (9100, 'Force him to confess', 9400, 16),
       (9100, 'Try to reason with him instead', 9200, NULL),

       (9200, 'Show Ashgrove the evidence', 9300, 17),
       (9200, 'Head to his office right now', 9100, NULL);

--ROLLBACK
--DELETE FROM story_option WHERE section_id IN (1, 20, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1300, 1400, 1500, 666, 999, 2001, 2020, 2030, 2500, 2666, 3000, 4001, 4020, 4100, 4200, 4300, 4400, 4500, 4600, 4700, 4800, 4900, 5000, 4666, 8001, 8020, 8100, 8200, 8300, 8400, 8500, 8600, 8700, 8800, 8900, 9000, 9100, 9200, 9300, 9400, 8650);
--DELETE FROM section WHERE id IN (1, 20, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1300, 1400, 1500, 666, 999, 2001, 2020, 2030, 2500, 2666, 3000, 4001, 4020, 4100, 4200, 4300, 4400, 4500, 4600, 4700, 4800, 4900, 5000, 4666, 8001, 8020, 8100, 8200, 8300, 8400, 8500, 8600, 8700, 8800, 8900, 9000, 9100, 9200, 9300, 9400, 8650);
--DELETE FROM consequence WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22);
--DELETE FROM book WHERE id IN (1, 2, 3, 4);