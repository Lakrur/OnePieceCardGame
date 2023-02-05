//
//  Arrays.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 05.02.2023.
//

import UIKit


var availableCharachter: [AllCharachter] =
[AllCharachter(id: 1, picture: UIImage(named: "babyLuffy")!, rarity: .epic, description: "luffy", isPurchased: true),
 AllCharachter(id: 2, picture: UIImage(named: "babyZoro")!, rarity: .common, description: "zoro", isPurchased: true),
 AllCharachter(id: 3, picture: UIImage(named: "babyCoby")!, rarity: .common, description: "coby", isPurchased: true),
 AllCharachter(id: 4, picture: UIImage(named: "babyUsopp")!, rarity: .common, description: "usopp", isPurchased: true),
 AllCharachter(id: 5, picture: UIImage(named: "alvida")!, rarity: .common, description: "alvida", isPurchased: true),
 AllCharachter(id: 6, picture: UIImage(named: "buggy")!, rarity: .common, description: "buggy", isPurchased: true),
 AllCharachter(id: 7, picture: UIImage(named: "helmeppo")!, rarity: .common, description: "helmepo", isPurchased: true),
 AllCharachter(id: 8, picture: UIImage(named: "morgan")!, rarity: .common, description: "morgan", isPurchased: true),
 AllCharachter(id: 9, picture: UIImage(named: "nami1ep")!, rarity: .common, description: "nami", isPurchased: true)].shuffled()

var shopCharachters: [AllCharachter] =
[AllCharachter(id: 10, picture: UIImage(named: "chopper")!, rarity: .uncommon, description: "Tony Tony Chopper, also known as Cotton Candy Lover Chopper, is the doctor of the Straw Hat Pirates and one of the Senior Officers of the Straw Hat Grand Fleet. Chopper is a reindeer that ate the Hito Hito no Mi, a Devil Fruit that allows its user to transform into a human hybrid or a human at will. He came from Drum Island and was taught how to be a doctor by his two parental figures, Doctors Hiriluk and Kureha. His dream is to one day become a doctor capable of curing any disease and wants to travel all across the world specifically in the hopes of accomplishing this dream. His bounty is 1,000 belly.", isPurchased: false),
 AllCharachter(id: 11, picture: UIImage(named: "katakuri")!, rarity: .epic, description: "Charlotte Katakuri one of the Three Sweet Commanders of the Big Mom Pirates. Extremely tall, large, and muscular man standing in at 509 cm. His bounty is 1,057,000,000 belly. Katakuri wields a trident named Mogura in battle. He was first seen wielding it during Sanji and Charlotte Pudding's wedding ceremony. When not in use, he keeps the trident inside his mochi body. Katakuri is extremely skilled in wielding his trident Mogura, which he uses in conjunction with his Devil Fruit powers and physical prowess to perform devastating thrusts. Katakuri ate the Mochi Mochi no Mi, a Special Paramecia-type Devil Fruit that lets him create, control, and transform his body into mochi at will. His mochi is extremely thick and adhesive, allowing him to trap even extremely strong enemies with it, although it loses its effectiveness when exposed to liquids. Katakuri is one of the very few people in the world who can use all three types of Haki. Katakuri possesses extraordinary prowess in Observation Haki, being able to use an advanced form of Kenbunshoku that allows him to see visions several seconds ahead.", isPurchased: false),
 AllCharachter(id: 12, picture: UIImage(named: "sabo")!, rarity: .epic, description: "Flame Emperor Sabo is the Revolutionary Army's chief of staff, recognized as the No. 2 of the entire organization and outranked only by Supreme Commander Monkey D. Dragon. He is also the sworn brother of the notorious pirates Monkey D. Luffy and the late Portgas D. Ace. He currently has a bounty of 602,000,000 belly. Sabo ate the Mera Mera no Mi, a Logia-type Devil Fruit that allows him to create, control, and transform his body into fire at will. Sabo has become a master of the Ryusoken fighting style, which revolves around the use of grips, which he refers to as claws. His grips are strong enough to break armor, great swords, artillery, and even skulls with ease and remaining unharmed. He also uses Haki to increase the strength of his fingers. He use a metal pipe, effectively battling against and defending himself from attacks . After obtaining the Mera Mera no Mi, Sabo can ignite the two ends of his pipe. He is also a strong user of Observation Haki and Weapon Haki.", isPurchased: false),
 AllCharachter(id: 13, picture: UIImage(named: "kuro")!, rarity: .common, description: "Kuro of a Hundred Plans, also known as Klahadore. He was the captain of the Black Cat Pirates until he decided to fake his capture and execution. After leaving the team, Kuro pretended to stumble upon the Syrup Village by chance, where he was adopted by the Kaya family and acted as her servant and caretaker of the mansion for three years, intending to inherit her fortune. Kuro is a skilled strategist whose plans are never thwarted by overthinking every little detail. With the help of Nuki Asi, Kuro begins to move at an incredibly superhuman speed, being able to overcome 100 meters in 4-5 seconds, from which he becomes as if invisible. He begins this move by making several quick leg movements to move to another location. This technique has a similar execution to Soru, however, unlike him, his leg movements are more noticeable. Kuro uses a weapon called Cat Claws, which are fur gloves with katana blades at the fingertips. Combining Cat's Claws with his impressive speed, Kuro is able to inflict deadly cuts on his opponent, however, he cannot deliver precision strikes, as he is unable, due to his speed, to see who he is attacking. His bounty is 16,000,000", isPurchased: false),
 AllCharachter(id: 14, picture: UIImage(named: "zeff")!, rarity: .common, description: "Zeff is a chef, former captain of the Kokov Pirates known as Red Leg, and Sanji's teacher.He is also Sanji's culinary teacher and adoptive father, adopting the boy after they spent several months together on a deserted island. Zeff was a hardcore pirate. He is always serious about everything. Zeff doesn't usually show emotions other than a hot temper. As the chef and owner of the Baratie, Zeff is very demanding and tough to manage. When Zeff was a pirate, he was famous for being a great chef and a great captain. He was an excellent cook, and he knew what and how to eat when the situation called for it. He has extraordinary leg strength. He could break through rock with ease, leave footprints on solid iron, and effortlessly overpower all of his enemies. Even after being amputated, he is able to swing his wooden leg with enough force to create an air current capable of extinguishing half a dozen burning projectiles in the air. He also remains extremely agile despite his age, often augmenting his strikes with difficult jumps. Zeff also has tremendous stamina, managing to survive 85 days without any food.", isPurchased: false),
 AllCharachter(id: 15, picture: UIImage(named: "craig")!, rarity: .common, description: "Don Krieg is the captain of Don Krieg's Pirate Armada and the most famous pirate in the East Blue. Krieg was considered the most feared pirate captain in all of the East Blue and had a fearsome reputation, with Krieg having a fleet of 50 ships and over 5,000 pirates, which, combined with active looting of towns and convoys, led the Marines to view Krieg as a major threat. Despite this, Krieg's fleet was too weak to stand against strong enemies such as Dracula Mihawk, who single-handedly destroyed almost the entire fleet. The main reason Krieg is nicknamed the Penalty Player is his fighting style, which revolves around firearms and gadgets hidden inside his crucible steel armor, such as a steel mace that is hidden under normal clothing to surprise attack and a spiked protective robe. . Krieg's use of weapons relies on the element of surprise and a large number of weapons, as well as the power of attacks to overwhelm his opponents. His bounty is 17,000,000 belly.", isPurchased: false),
 AllCharachter(id: 16, picture: UIImage(named: "arlong")!, rarity: .uncommon, description: "Saw Arlong is a fish-man sawnose shark. He was the captain of the Arlong Pirates and a former member of the Sun Pirates, as well as Madame Shyarly's older brother. Had the highest bounty in the East Blue before being defeated by pirate Monkey D. Luffy. His bounty is 20,000,000 belly. When attacking the village of Cocoyashi, Arlong did not initially use a weapon, but then took out a pistol, from which he shot Bell-mere. Arlong has sawtooth-shaped teeth, extremely sharp, and also unusually powerful jaws. He can easily bite through a sword, a gun barrel, a cannonball, and in a battle with Luffy he gnawed a marble column. His teeth can be pulled out or knocked out, but they grow back almost instantly and become even sharper. Arlong wielded a giant sawtooth sword, Kiribati, with great skill, as he was able to severely damage a building.Water Bullet: Arlong throws a handful of water that hits like a gunshot. Brass Jaw: Arlong takes out a pair of his teeth and uses them like brass knuckles. Shark Throw: Arlong accelerates to tremendous speed (increasing even further underwater) and lunges at an enemy, aiming to impale them with his nose.", isPurchased: false),
 AllCharachter(id: 17, picture: UIImage(named: "hatchan")!, rarity: .uncommon, description: "Hatchan, nicknamed Hati, is an octopus fishman. Former officer of the Arlong Pirates and former member of the Sun Pirates. After the members of the Arlong Pirates were arrested, Hatchan was the only one who managed to escape. After going through many adventures, Hatchan opened a Takoyaki floating restaurant, soon after which he met and befriended the Straw Hat Pirates again. As a fishman, Hatchan is 10 times stronger than a normal human on land, and 2 times more powerful in water. As an officer of the Arlong Pirates, he is much stronger, as he was able to defeat three members of the Macro Pirates by himself. His physical strength allows him to wield six swords, each weighing over 300 kg, in combat. He is also aware of Haki's existence, but admits that he knows very little about it. Hatchan is an accomplished swordsman. He stated that he was the number two swordsman in all of Fish-Man Island. Hatchan possesses great stamina, as he was able to survive being severely injured by Zoro's three swords and Sanji's punch. Since fishmen have great stamina, they survive high water pressure and have great strength. His bounty is 8,000,000 belly.", isPurchased: false),
 AllCharachter(id: 18, picture: UIImage(named: "dalton")!, rarity: .uncommon, description: "Dalton is the king of the Sakura Kingdom. He is a former Royal Guard who once served Wapol. Dalton is a good fighter. He has great strength, enhanced by his Devil Fruit abilities, and is fast enough to dodge bullets. He is also very durable and hardy. Dalton ate the Devil Fruit - Ushi Ushi no Mi, Model: Bison, which allows him to transform into a bison and a half-human, half-buffalo form that makes him look like a minotaur. His hybrid form is mainly used for fighting and is powerful enough to stop Chopper's Heavy Point. However, this fruit's main advantage seems to be not strength, but surprisingly speed: its quadrupedal bull form allows it to run at a much higher speed. As a weapon, Dalton uses a spade, a large polearm with an overly wide blade. Dalton is very professional with his blade, combining it with his Devil Fruit abilities.", isPurchased: false),
 AllCharachter(id: 19, picture: UIImage(named: "kureha")!, rarity: .common, description: "Dr. Kureha is a woman whose age is currently 141 years old. Lives on Drum Island. He is the head of Issi-100. Some people in the Sakura Kingdom believe her to be a witch. Mentor of Tony Tony Chopper. Dr. Kureha has great ability as a doctor, which proves her state of good health even though she is 141 years old. She manages to cure Nami when she was bitten by an ancient beetle, Kestia, which was thought to be extinct, making it difficult to heal. Also, she is one of the few doctors from around the world who are authorized to use a very limited drug - NHC10. She was able to teach many skills and knowledge to Chopper, who became a great doctor. Outside of her medical skills, she possesses a certain level of superhuman strength and agility. She showed her strength when she destroyed a stone wall with ease. Also, she has a high resistance to cold, all due to the fact that she often walks in light clothes in the cold places of the castle and island.Stopping the Doctor: Whenever she sees a patient doing something that she thinks might jeopardize her medical procedures or interrupt the recovery process, she tries to stop them at all costs, even if it's hard hitting the ground and stomping on body.", isPurchased: false),
 AllCharachter(id: 20, picture: UIImage(named: "hiriluk")!, rarity: .common, description: "Dr. Hiriluk is a quack doctor from Drum Island, as well as Chopper's first nakama and mentor. Before becoming a charlatan doctor, Hiruruk was a thief and robber. Tony Tony Chopper was very close to Hiruk, although at first, when they first met, Chopper attacked him, frightened by the doctor's tranquilizer gun. Hiruruk stripped naked in the cold to prove to Chopper that he would never hurt him. Only after this act did Chopper believe him and allow himself to be cured. After this incident, Chopper and Hiruruk began living together and spending a lot of time together, such as going to a neighboring village together to cure a sick man, and then fighting because Hiruruk was using Chopper as bait. Hiruruk trusted and loved Chopper very much, giving him a hat with a cross, which Chopper never parted with again. At the end of his treatment, however, Chopper found himself thrown out on the street. Hirook, as it turned out later, only did it because he wanted to protect his feelings - he was about to die of an incurable disease.", isPurchased: false),
 AllCharachter(id: 21, picture: UIImage(named: "wapol")!, rarity: .uncommon, description: "Tin Wapol is the former king of the Drum Kingdom. He became a pirate after he fled his country when Marshall D. Teach and his crew attacked Drum Island. After Wapol lost to the Straw Hat Pirates, he became the head of his own toy factory, and two years later, he received a kingdom from the World Nobles and is now the king of the Dark Drum Kingdom. Wapol is surprisingly cunning, as he was able to figure out how to conquer his country, and he later developed a plan to capture Dr. Hiruruka using his personality traits. Apparently, he has enough combat experience and mostly Wapol relies on his subordinates for such tasks. Being a pirate, he and his crew were able to survive in the rather dangerous waters of the Grand Line. Wapol and his cabinet managed to conquer an entire country, and Wapol easily defeated Dalton at his strongest form. Possesses the power of the Baku Baku no Mi Devil Fruit. The Baku Baku no Mi is a Paramecia-type Devil Fruit that allows the user to eat and chew anything (except for the Kairoseki), from wood to the strongest metals. Eaten items can be fused with the user's body into a weapon, or combined together to create something else.", isPurchased: false),
 AllCharachter(id: 22, picture: UIImage(named: "crocodile")!, rarity: .epic, description: "Crocodile was the president of a secret criminal organization, Baroque Works. He was originally inducted as a Shichibukai, but was stripped of his title after attempting to take control of the desert kingdom, Alabasta. Thanks to Luffy, he managed to escape from Impel Down and participate in the war at Marineford. After these events, he and Daz Bones decide to go to the New World. Crocodile is extremely smart and cunning, as shown by his ability to hide his organization from the government and at the same time make himself a hero in the eyes of the people. Crocodile has eaten the Logia Suna Suna no Mi, allowing him to manipulate sand and turn into it himself. He was able to master his powers to perfection, allowing him to reflexively turn into sand if attacked. In addition to being one of the few characters who was able to fully develop the ability of his Devil Fruit, Crocodile is also good at hand-to-hand combat. The gold part of the main hook can be removed. Beneath it, Crocodile hides a hook impregnated with scorpion venom. The poison is so strong that it can melt stone. In the most extreme case, if its hook breaks, then a dagger is hidden inside the base, with which it can surprise attacks. His bounty is 1,965,000,000 belly.", isPurchased: false),
 AllCharachter(id: 23, picture: UIImage(named: "dazbonez")!, rarity: .rare, description: "Daz Bonez, a former bounty hunter who joined Baroque Works and was the highest ranking male of the High Agents and next in power to Crocodile. His code name was Mr. 1 and his partner was Miss Doublefinger. Formerly known as the West Blue Bounty Hunter, Bones is a martial artist. Even without his Devil Fruit abilities, he is a strong and dangerous opponent. Daz Bones is a fruit user that possesses the power of the Supa Supa no Mi, which allows him to turn any part of his body into an ultra-thin and durable blade, making him a formidable foe in combat. It combines the fruit's strength and martial arts skills and is a living weapon. The Supa Supa no Mi gives Mr. 1 many different weapons and protects his body from almost all damage, as the blade body is as hard as steel. His bounty is 75,000,000", isPurchased: false)]

