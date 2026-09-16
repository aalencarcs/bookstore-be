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
       (3, 'The Crystal Caverns', 'Evelyn Stormrider', 'EASY', 'Adventure');

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
       (12, 'LOSE_HEALTH', 5, 'The freezing water chills you to the bone.');

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
       (2666, 2, 'Some unreachable node', 'NODE'),

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
       (4666, 3, 'An unreachable dead end. You shouldn''t be here.', 'NODE');

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
       (2030, 'Try to open the door with the key', 3000, NULL),
       (2500, 'Gather your thoughts', 2001, 8),

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
       (4900, 'Investigate the movement', 4666, NULL);

SELECT setval(pg_get_serial_sequence('book', 'id'), (SELECT MAX(id) FROM book));
SELECT setval(pg_get_serial_sequence('consequence', 'id'), (SELECT MAX(id) FROM consequence));

--ROLLBACK
--DELETE FROM story_option WHERE section_id IN (1, 20, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1300, 1400, 1500, 666, 999, 2001, 2020, 2030, 2500, 2666, 3000, 4001, 4020, 4100, 4200, 4300, 4400, 4500, 4600, 4700, 4800, 4900, 5000, 4666);
--DELETE FROM section WHERE id IN (1, 20, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1300, 1400, 1500, 666, 999, 2001, 2020, 2030, 2500, 2666, 3000, 4001, 4020, 4100, 4200, 4300, 4400, 4500, 4600, 4700, 4800, 4900, 5000, 4666);
--DELETE FROM consequence WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
--DELETE FROM book WHERE id IN (1, 2, 3);