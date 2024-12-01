PRAGMA foreign_keys = ON;

INSERT INTO Client (id, name, email, phoneNumber, taxID) VALUES
(1, 'João Silva', 'joaosilva@email.com', '942002381', '123456789'),
(2, 'Carla Rodrigues', 'carlarodrigues@email.com', '098712345', '987654321'),
(3, 'Hugo Ferreira', 'hugoferreira@email.com', '829331468', '014229642'),
(4, 'Beatriz Santos', 'beatrizsantos@email.com', '492512282', '024677216'),
(5, 'Diogo Fernandes', 'diogofernandes@email.com', '144930672', '462813241'),
(6, 'Miguel Oliveira', 'migueloliveira@email.com', '932513724', '734192342'),
(7, 'Ana Moura', 'anamoura@email.com', '913845672', '236549871'),
(8, 'Rui Alves', 'ruialves@email.com', '937152489', '758492136'),
(9, 'Filipa Carvalho', 'filipacarvalho@email.com', '967123845', '358149276'),
(10, 'Paulo Mendes', 'paulomendes@email.com', '921837456', '246837915'),
(11, 'Isabel Cunha', 'isabelcunha@email.com', '958371245', '547812369');


INSERT INTO Guest (id, name, taxID) VALUES
(1, 'Sofia Pereira', '277631951'),
(2, 'Pedro Martins', '927313272'),
(3, 'Marta Pereira', '179836230'),
(4, 'Leonor Faria', '374915862'),
(5, 'Tiago Costa', '481259736'),
(6, 'Carolina Nogueira', '174953628'),
(7, 'João Silva','123456789'),
(8, 'Carla Rodrigues', '987654321'),
(9, 'Hugo Ferreira', '014229642'),
(10, 'Beatriz Santos', '024677216'),
(11, 'Diogo Fernandes', '462813241'),
(12, 'Miguel Oliveira', '734192342'),
(13, 'Ana Moura', '236549871'),
(14, 'Rui Alves', '758492136'),
(15, 'Filipa Carvalho', '358149276'),
(16, 'Paulo Mendes', '246837915'),
(17, 'Isabel Cunha', '547812369');


INSERT INTO Receptionist (id, name, email, phoneNumber, taxID) VALUES
(1, 'Ricardo Gomes', 'ricardogomes@email.com', '422379156', '026681461'),
(2, 'Maria Costa', 'mariacosta@email.com', '193362849', '923701591'),
(3, 'Francisco Sousa', 'franciscosousa@email.com', '921345678', '159486273'),
(4, 'Helena Teixeira', 'helenateixeira@email.com', '917823456', '846359721'),
(5, 'Diana Almeida', 'dianaalmeida@email.com', '917835642', '785492613');

INSERT INTO Cleaner (id, name, email, phoneNumber, taxID) VALUES
(1, 'Antonio Santos', 'antoniosantos@email.com', '926724154', '449351953'),
(2, 'Rosa Marques', 'rosamarques@email.com', '938216547', '273651849'),
(3, 'Carlos Ribeiro', 'carlosribeiro@email.com', '926314875', '819273645'),
(4, 'Fernanda Matos', 'fernandamatos@email.com', '918234576', '356871429');

INSERT INTO RoomType (id, capacity, size) VALUES
(1, 2, 24),
(2, 4, 42),
(3, 2, 21),
(4, 3, 34),
(5, 4, 46);

INSERT INTO Room (id, floor, roomType) VALUES
(101, 1, 1),
(102, 2, 2),
(103, 2, 4),
(201, 2, 3),
(202, 2, 5),
(203, 2, 5),
(301, 3, 2),
(302, 3, 4),
(303, 3, 5);

INSERT INTO Amenity (id, name) VALUES
(1, 'Free breakfast'),
(2, 'TV'),
(3, 'Room Service'),
(4, 'Coffee Maker'),
(5, 'Air Conditioning');

INSERT INTO RoomTypeAmenity (roomType, amenity) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 5),
(3, 2),
(3, 3),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 5);

INSERT INTO Season (startDate, endDate) VALUES
('2024-01-01', '2024-03-31'),
('2024-04-01', '2024-06-30'),
('2024-07-01', '2024-09-30'),
('2024-10-01', '2024-12-31');


INSERT INTO Service (id, description) VALUES
(1, 'Room Cleaning'),
(2, 'Laundry Service'),
(3, 'Spa Treatment'),
(4, 'Tour Guide');

INSERT INTO ServiceSeasonPrice (service, seasonStartDate, seasonEndDate, price) VALUES
(1, '2024-01-01', '2024-03-31', 20.0),
(1, '2024-04-01', '2024-06-30', 30.0),
(1, '2024-07-01', '2024-09-30', 50.0),
(1, '2024-10-01', '2024-12-31', 100.0),
(2, '2024-01-01', '2024-03-31', 35.0),
(2, '2024-04-01', '2024-06-30', 40.0),
(2, '2024-07-01', '2024-09-30', 55.0),
(2, '2024-10-01', '2024-12-31', 120.0),
(3, '2024-01-01', '2024-03-31', 30.0),
(3, '2024-04-01', '2024-06-30', 50.0),
(3, '2024-07-01', '2024-09-30', 75.0),
(3, '2024-10-01', '2024-12-31', 150.0),
(4, '2024-01-01', '2024-03-31', 35.0),
(4, '2024-04-01', '2024-06-30', 60.0),
(4, '2024-07-01', '2024-09-30', 80.0),
(4, '2024-10-01', '2024-12-31', 200.0);

INSERT INTO RoomSeasonPrice (roomType, seasonStartDate, seasonEndDate, price) VALUES
(1, '2024-01-01', '2024-03-31', 120.0),
(1, '2024-04-01', '2024-06-30', 100.0),
(1, '2024-07-01', '2024-09-30', 85.0),
(1, '2024-10-01', '2024-12-31', 150.0),
(2, '2024-01-01', '2024-03-31', 132.0),
(2, '2024-04-01', '2024-06-30', 110.0),
(2, '2024-07-01', '2024-09-30', 93.5),
(2, '2024-10-01', '2024-12-31', 165.0),
(3, '2024-01-01', '2024-03-31', 144.0),
(3, '2024-04-01', '2024-06-30', 120.0),
(3, '2024-07-01', '2024-09-30', 102.0),
(3, '2024-10-01', '2024-12-31', 180.0),
(4, '2024-01-01', '2024-03-31', 156.0),
(4, '2024-04-01', '2024-06-30', 130.0),
(4, '2024-07-01', '2024-09-30', 110.5),
(4, '2024-10-01', '2024-12-31', 195.0),
(5, '2024-01-01', '2024-03-31', 168.0),
(5, '2024-04-01', '2024-06-30', 140.0),
(5, '2024-07-01', '2024-09-30', 119.0),
(5, '2024-10-01', '2024-12-31', 210.0);


INSERT INTO Reservation (id, startDate, endDate, checkInTime, checkOutTime, status, client, receptionist) VALUES
(1, '2024-02-01', '2024-02-05', '14:00', '11:00', 'Confirmed', 1, 1),
(2, '2024-07-15', '2024-07-20', '15:00', '11:00', 'Confirmed', 7, 5),
(3, '2024-11-05', '2024-11-10', '14:00', '11:00', 'Pending', 4, 3),
(4, '2024-08-01', '2024-08-10', '15:00', '12:00', 'Confirmed', 11, 2),
(5, '2024-12-20', '2024-12-25', '14:00', '11:00', 'Pending', 10, 3);

INSERT INTO Cancellation (id, reason, date, reservation) VALUES
(1, 'Client Request', '2024-02-03', 1),
(2, 'Health Issues', '2024-12-22', 5),
(3, 'Weather Conditions', '2025-03-17', 3);

INSERT INTO ReservationRoom (reservation, room, reservationDate) VALUES
(1, 101, '2024-02-01'),
(1, 101, '2024-02-02'),
(1, 101, '2024-02-03'),
(1, 101, '2024-02-04'),
(1, 101, '2024-02-05'),
(2, 201, '2024-07-15'),
(2, 201, '2024-07-16'),
(2, 201, '2024-07-17'),
(2, 201, '2024-07-18'),
(2, 201, '2024-07-19'),
(2, 201, '2024-07-20'),
(3, 302, '2024-11-05'),
(3, 302, '2024-11-06'),
(3, 302, '2024-11-07'),
(3, 302, '2024-11-08'),
(3, 302, '2024-11-09'),
(3, 302, '2024-11-10'),
(4, 201, '2024-08-01'),
(4, 201, '2024-08-02'),
(4, 201, '2024-08-03'),
(4, 201, '2024-08-04'),
(4, 201, '2024-08-05'),
(4, 201, '2024-08-06'),
(4, 201, '2024-08-07'),
(4, 201, '2024-08-08'),
(4, 201, '2024-08-09'),
(4, 201, '2024-08-10'),
(5, 203, '2024-12-20'),
(5, 203, '2024-12-21'),
(5, 203, '2024-12-22'),
(5, 203, '2024-12-23'),
(5, 203, '2024-12-24'),
(5, 203, '2024-12-25');

INSERT INTO ReservationService (reservation, service) VALUES
(1, 1),
(4, 3),
(5, 2),
(2, 4);

INSERT INTO CleanerRoom (cleaner, room, date, startHour, endHour) VALUES
(1, 101, '2024-02-02', '09:00', '10:00'),
(2, 203, '2025-03-16', '08:00', '09:30'),
(3, 102, '2024-08-02', '10:00', '11:00'),
(4, 201, '2024-12-21', '09:00', '10:00'),
(3, 302, '2024-12-21', '09:00', '10:00');

INSERT INTO GuestRoom (guest, room) VALUES
(1, 101),
(3, 102),
(5, 201),
(4, 202),
(9, 203);
