INSERT INTO `licenses` (`type`, `label`) VALUES
('jour1', 'jour1'),
('jour2', 'jour2'),
('jour3', 'jour3'),
('jour4', 'jour4'),
('jour5', 'jour5'),
('jour6', 'jour6'),
('jour7', 'jour7'),
('jour8', 'jour8'),
('jour9', 'jour9'),
('jour10', 'jour10'),
('jour11', 'jour11'),
('jour12', 'jour12'),
('jour13', 'jour13'),
('jour14', 'jour14'),
('jour15', 'jour15'),
('jour16', 'jour16'),
('jour17', 'jour17'),
('jour18', 'jour18'),
('jour19', 'jour19'),
('jour20', 'jour20'),
('jour21', 'jour21'),
('jour22', 'jour22'),
('jour23', 'jour23'),
('jour24', 'jour24'),
('jour25', 'jour25');

ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;
COMMIT;

ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);


CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
