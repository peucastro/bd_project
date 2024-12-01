DROP TABLE IF EXISTS CleanerRoom;
DROP TABLE IF EXISTS GuestRoom;
DROP TABLE IF EXISTS ReservationRoom;
DROP TABLE IF EXISTS ReservationService;
DROP TABLE IF EXISTS RoomTypeAmenity;
DROP TABLE IF EXISTS RoomSeasonPrice;
DROP TABLE IF EXISTS ServiceSeasonPrice;
DROP TABLE IF EXISTS RoomPictures;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS RoomType;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Cancellation;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Cleaner;
DROP TABLE IF EXISTS Receptionist;
DROP TABLE IF EXISTS Guest;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Amenity;
DROP TABLE IF EXISTS Season;

CREATE TABLE Client (
    id INTEGER CONSTRAINT pk_client PRIMARY KEY,
    name TEXT CONSTRAINT not_null_client_name NOT NULL,
    email TEXT CONSTRAINT unique_client_email UNIQUE CONSTRAINT not_null_client_email NOT NULL,
    phoneNumber TEXT CONSTRAINT unique_client_phoneNumber UNIQUE CONSTRAINT not_null_client_phoneNumber NOT NULL,
    taxID TEXT CONSTRAINT unique_client_taxID UNIQUE CONSTRAINT not_null_client_taxID NOT NULL,
    CONSTRAINT valid_client_email CHECK (instr(email, '@') > 1)
);

CREATE TABLE Guest (
    id INTEGER CONSTRAINT pk_guest PRIMARY KEY,
    name TEXT CONSTRAINT not_null_guest_name NOT NULL,
    taxID TEXT CONSTRAINT unique_guest_taxID UNIQUE CONSTRAINT not_null_guest_taxID NOT NULL
);

CREATE TABLE Receptionist (
    id INTEGER CONSTRAINT pk_receptionist PRIMARY KEY,
    name TEXT CONSTRAINT not_null_receptionist_name NOT NULL,
    email TEXT CONSTRAINT unique_receptionist_email UNIQUE CONSTRAINT not_null_receptionist_email NOT NULL,
    phoneNumber TEXT,
    taxID TEXT CONSTRAINT unique_receptionist_taxID UNIQUE CONSTRAINT not_null_receptionist_taxID NOT NULL,
    CONSTRAINT valid_receptionist_email CHECK (instr(email, '@') > 1)
);

CREATE TABLE Cleaner (
    id INTEGER CONSTRAINT pk_cleaner PRIMARY KEY,
    name TEXT CONSTRAINT not_null_cleaner_name NOT NULL,
    email TEXT CONSTRAINT unique_cleaner_email UNIQUE CONSTRAINT not_null_cleaner_email NOT NULL,
    phoneNumber TEXT,
    taxID TEXT CONSTRAINT unique_cleaner_taxID UNIQUE CONSTRAINT not_null_cleaner_taxID NOT NULL,
    CONSTRAINT valid_cleaner_email CHECK (instr(email, '@') > 1)
);

CREATE TABLE Reservation (
    id INTEGER CONSTRAINT pk_reservation PRIMARY KEY,
    startDate DATE CONSTRAINT not_null_reservation_startDate NOT NULL,
    endDate DATE CONSTRAINT not_null_reservation_endDate NOT NULL,
    checkInTime TIME,
    checkOutTime TIME,
    status TEXT DEFAULT 'Pending' CONSTRAINT not_null_reservation_status NOT NULL,
    client INTEGER CONSTRAINT not_null_reservation_client NOT NULL,
    receptionist INTEGER CONSTRAINT not_null_reservation_receptionist NOT NULL,
    FOREIGN KEY (client) REFERENCES Client(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (receptionist) REFERENCES Receptionist(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT valid_reservation_dates CHECK (startDate <= endDate),
    CONSTRAINT valid_reservation_status CHECK (status IN ('Reserved', 'Pending', 'Cancelled', 'Confirmed'))
);

CREATE TABLE Cancellation (
    id INTEGER CONSTRAINT pk_cancellation PRIMARY KEY,
    reason TEXT DEFAULT 'No reason provided' CONSTRAINT not_null_cancellation_reason NOT NULL,
    date DATE CONSTRAINT not_null_cancellation_date NOT NULL,
    reservation INTEGER CONSTRAINT not_null_cancellation_reservation NOT NULL,
    FOREIGN KEY (reservation) REFERENCES Reservation(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Service (
    id INTEGER CONSTRAINT pk_service PRIMARY KEY,
    description TEXT CONSTRAINT not_null_service_description NOT NULL
);

CREATE TABLE Room (
    id INTEGER CONSTRAINT pk_room PRIMARY KEY,
    floor INTEGER CONSTRAINT not_null_room_floor NOT NULL,
    roomType INTEGER CONSTRAINT not_null_room_roomType NOT NULL,
    FOREIGN KEY (roomType) REFERENCES RoomType(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE RoomType (
    id INTEGER CONSTRAINT pk_roomtype PRIMARY KEY,
    capacity INTEGER CONSTRAINT not_null_roomType_capacity NOT NULL,
    size INTEGER CONSTRAINT not_null_roomType_size NOT NULL,
    CONSTRAINT valid_roomType_capacity CHECK (capacity >= 1),
    CONSTRAINT valid_roomType_size CHECK (size > 0)
);

CREATE TABLE RoomPictures (
    id INTEGER CONSTRAINT pk_roompictures PRIMARY KEY,
    picture BLOB CONSTRAINT not_null_roomPicture_picture NOT NULL,
    roomType INTEGER CONSTRAINT not_null_roomPicture_roomType NOT NULL,
    FOREIGN KEY (roomType) REFERENCES RoomType(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Amenity (
    id INTEGER CONSTRAINT pk_amenity PRIMARY KEY,
    name TEXT CONSTRAINT not_null_amenity_name NOT NULL
);

CREATE TABLE Season (
    startDate DATE CONSTRAINT not_null_season_startDate NOT NULL,
    endDate DATE CONSTRAINT not_null_season_endDate NOT NULL,
    CONSTRAINT pk_season PRIMARY KEY (startDate, endDate),
    CONSTRAINT valid_season_dates CHECK (startDate <= endDate)
);

CREATE TABLE ReservationService (
    reservation INTEGER CONSTRAINT not_null_reservationService_reservation NOT NULL,
    service INTEGER CONSTRAINT not_null_reservationService_service NOT NULL,
    CONSTRAINT pk_reservationservice PRIMARY KEY (reservation, service),
    FOREIGN KEY (reservation) REFERENCES Reservation(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (service) REFERENCES Service(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ReservationRoom (
    reservation INTEGER CONSTRAINT not_null_reservationRoom_reservation NOT NULL,
    room INTEGER CONSTRAINT not_null_reservationRoom_room NOT NULL,
    startDate DATE CONSTRAINT not_null_reservationRoom_startDate NOT NULL,
    CONSTRAINT pk_reservationroom PRIMARY KEY (reservation, room, startDate),
    FOREIGN KEY (reservation) REFERENCES Reservation(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (room) REFERENCES Room(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CleanerRoom (
    cleaner INTEGER CONSTRAINT not_null_cleanerRoom_cleaner NOT NULL,
    room INTEGER CONSTRAINT not_null_cleanerRoom_room NOT NULL,
    date DATE CONSTRAINT not_null_cleanerRoom_date NOT NULL,
    startHour TIME CONSTRAINT not_null_cleanerRoom_startHour NOT NULL,
    endHour TIME CONSTRAINT not_null_cleanerRoom_endHour NOT NULL,
    CONSTRAINT pk_cleanerroom PRIMARY KEY (cleaner, room, date, startHour),
    FOREIGN KEY (cleaner) REFERENCES Cleaner(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (room) REFERENCES Room(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT valid_cleanerRoom_hours CHECK (startHour < endHour)
);

CREATE TABLE GuestRoom (
    guest INTEGER CONSTRAINT not_null_guestRoom_guest NOT NULL,
    room INTEGER CONSTRAINT not_null_guestRoom_room NOT NULL,
    CONSTRAINT pk_guestroom PRIMARY KEY (guest, room),
    FOREIGN KEY (guest) REFERENCES Guest(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (room) REFERENCES Room(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RoomTypeAmenity (
    roomType INTEGER CONSTRAINT not_null_roomTypeAmenity_roomType NOT NULL,
    amenity INTEGER CONSTRAINT not_null_roomTypeAmenity_amenity NOT NULL,
    CONSTRAINT pk_roomtypeamenity PRIMARY KEY (roomType, amenity),
    FOREIGN KEY (roomType) REFERENCES RoomType(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (amenity) REFERENCES Amenity(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ServiceSeasonPrice (
    service INTEGER CONSTRAINT not_null_serviceSeasonPrice_service NOT NULL,
    seasonStartDate DATE CONSTRAINT not_null_serviceSeasonPrice_seasonStartDate NOT NULL,
    seasonEndDate DATE CONSTRAINT not_null_serviceSeasonPrice_seasonEndDate NOT NULL,
    price REAL CONSTRAINT not_null_serviceSeasonPrice_price NOT NULL,
    CONSTRAINT pk_serviceseasonprice PRIMARY KEY (service, seasonStartDate, seasonEndDate),
    FOREIGN KEY (service) REFERENCES Service(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (seasonStartDate, seasonEndDate) REFERENCES Season(startDate, endDate) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT valid_serviceSeasonPrice_price CHECK (price >= 0)
);

CREATE TABLE RoomSeasonPrice (
    roomType INTEGER CONSTRAINT not_null_roomSeasonPrice_roomType NOT NULL,
    seasonStartDate DATE CONSTRAINT not_null_roomSeasonPrice_seasonStartDate NOT NULL,
    seasonEndDate DATE CONSTRAINT not_null_roomSeasonPrice_seasonEndDate NOT NULL,
    price REAL CONSTRAINT not_null_roomSeasonPrice_price NOT NULL,
    CONSTRAINT pk_roomseasonprice PRIMARY KEY (roomType, seasonStartDate, seasonEndDate),
    FOREIGN KEY (roomType) REFERENCES RoomType(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (seasonStartDate, seasonEndDate) REFERENCES Season(startDate, endDate) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT valid_roomSeasonPrice_price CHECK (price >= 0)
);
