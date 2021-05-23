-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 23 2021 г., 20:52
-- Версия сервера: 5.6.47
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `srez`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'мем'),
(3, 'прикол мем');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1621085426);

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Новая',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `before_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `after_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `why_not` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `status`, `name`, `before_img`, `after_img`, `why_not`, `category_id`, `created_at`, `created_by`, `updated_by`) VALUES
(15, 'Новая', 'Ахахахахаха', 'uploads/aP57X5aD14c.jpg', 'uploads/6f340467eab7ce506adb4b83d916ea3a.png', '', 2, '2021-05-16 01:51:44', 100, 100),
(16, 'Решена', 'Зачем', 'uploads/orange.png', 'uploads/змеяя.png', '', 2, '2021-05-16 01:52:11', 100, 100),
(17, 'Решена', 'Рыба', 'uploads/sdssgsd.png', 'uploads/teSiUyPzs4o.jpg', '', 2, '2021-05-16 01:52:40', 100, 100),
(19, 'Решена', 'Убить', 'uploads/gsdgsdgsdgsdg.png', 'uploads/1511206581-7721.jpg', '', 2, '2021-05-23 20:27:04', 100, 100),
(20, 'Решена', 'sd', 'uploads/aP57X5aD14c.jpg', 'uploads/15868790746090.png', '', 2, '2021-05-23 20:29:38', 100, 100),
(21, 'Решена', 'Чел ты........', 'uploads/dude.jpg', 'uploads/sssss.jpg', '', 2, '2021-05-23 20:31:33', 100, 100),
(22, 'Отклонена', 'Убить', 'uploads/_TTPMWXvdQk.jpg', 'uploads/a3af0688f4056f2f12868199d65315a191e6f2be_full.png', '', 2, '2021-05-23 20:37:49', 100, 100),
(23, 'Отклонена', 'k', 'uploads/1645dd880499e4885bb29ba2183bf360.jpg', 'uploads/fgf.png', '', 2, '2021-05-23 20:49:31', 100, 100);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
