create database MinecraftGAM106;

use MinecraftGAM106;

create table Player(
    PlayerID int primary key identity,
    Name nvarchar(50) not null,
    Email nvarchar(100) not null unique,
    Password nvarchar(50) not null
);


create table GameMode(
    GameModeID int primary key identity,
    ModeName nvarchar(50) not null,
    Description nvarchar(255)
);


create table Item(
    ItemID int primary key identity,
    ItemName nvarchar(50) not null,
    Image nvarchar(255),
    Price int not null,
    Category nvarchar(50)
);


create table Vehicle(
    VehicleID int primary key identity,
    VehicleName nvarchar(50) not null,
    Speed int,
    Price int not null
);


create table Quest(
    QuestID int primary key identity,
    QuestName nvarchar(50) not null,
    RewardEXP int not null
);


create table Monster(
    MonsterID int primary key identity,
    MonsterName nvarchar(50) not null,
    Health int,
    EXPReward int
);


create table Player_GameMode(
    PlayerID int foreign key references Player(PlayerID),
    GameModeID int foreign key references GameMode(GameModeID),
    primary key (PlayerID, GameModeID)
);
create table Player_Quest(
    PlayerID int foreign key references Player(PlayerID),
    QuestID int foreign key references Quest(QuestID),
    CompletionStatus bit not null,
    primary key (PlayerID, QuestID)
);


create table Player_Item(
    PlayerID int foreign key references Player(PlayerID),
    ItemID int foreign key references Item(ItemID),
    Quantity int not null,
    primary key (PlayerID, ItemID)
);


create table Player_Vehicle(
    PlayerID int foreign key references Player(PlayerID),
    VehicleID int foreign key references Vehicle(VehicleID),
    OwnershipDate datetime not null,
    primary key (PlayerID, VehicleID)
);


create table Quest_Monster(
    QuestID int foreign key references Quest(QuestID),
    MonsterID int foreign key references Monster(MonsterID),
    RequiredKillCount int not null,
    primary key (QuestID, MonsterID)
);



insert into Player (Name, Email, Password)
values ('Đạt T', 'Phantuandat91203@gmail.com', '5469871'),
       ('Duy H', 'Duy123456789@gmail.com', '1356487'),
       ('Mạnh 5000', 'Manhdao458@gmail.com', '6987421'),
	   ('Linh xeom', 'Linhnarakatop1@gmail.com', '8451331'),
	   ('hoàng gà', 'Hoangnarakatop2@gmail.com', '7845121');



insert into GameMode (ModeName, Description)
values ('Survival', 'Thu thập tài nguyên và sinh tồn chống lại quái vật'),
       ('Creative', 'Xây dựng mọi thứ với tài nguyên không giới hạn'),
       ('Adventure', 'Khám phá và hoàn thành nhiệm vụ');


insert into Item (ItemName, Image, Price, Category)
values ('Sword', 'sword.png', 100, 'Weapon'),
       ('Shield', 'shield.png', 150, 'Armor'),
       ('Pickaxe', 'pickaxe.png', 120, 'Tool');


insert into Vehicle (VehicleName, Speed, Price)
values ('Horse', 60, 500),
       ('Boat', 80, 700),
       ('Minecart', 50, 300);