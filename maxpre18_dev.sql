-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 02/07/2020 às 10:17
-- Versão do servidor: 5.6.39-83.1
-- Versão do PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `maxpre18_dev`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `activity_log`
--

CREATE TABLE `activity_log` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `address`
--

CREATE TABLE `address` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'BRASIL',
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addresable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addresable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `address`
--

INSERT INTO `address` (`id`, `company_id`, `user_id`, `name`, `slug`, `zip`, `city`, `state`, `country`, `street`, `district`, `number`, `complement`, `addresable_type`, `addresable_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
('354929d0-1c83-423f-9cec-7cc6d8c8954d', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Srta. Pâmela Adriana Cortês', 'srta-pamela-adriana-cortes', '40556-408', 'Saraiva do Leste', 'DF', 'BRASIL', 'R. Fátima Oliveira, 05. Apto 77', 'Travessa Pâmela Martines', '45921', 'Apto 07', 'App\\User', '1021ff71-bb91-4b20-a965-6c95378250b8', 'published', NULL, '2020-02-15 04:35:39', '2020-02-15 04:35:39'),
('03529597-3583-457a-a799-ae7a2a93a49a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Company', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'published', NULL, '2020-02-15 05:42:15', '2020-02-15 05:42:15'),
('efb225ae-65f8-4bf3-a579-8e5cf97dc540', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', NULL, NULL, '89805-545', 'Chapecó', 'SC', 'BRASIL', 'Rua Pequim', NULL, '385', 'apto 201', 'App\\User', '299e0511-8304-42af-90e2-6046cb79c99d', 'published', NULL, '2020-02-15 05:42:44', '2020-02-15 05:42:44'),
('ec7e346f-7356-43ba-8e36-062392a8d91f', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', NULL, NULL, '89805-545', 'Chapecó', 'SC', 'BRASIL', 'Rua Pequim - até 667/668,', 'Passo dos Fortes', '385', 'apto 201', 'App\\Provider', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'published', NULL, '2020-02-15 05:43:41', '2020-02-15 05:43:41'),
('251f6e12-48a7-4efd-9255-c56f569d3545', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', NULL, NULL, '88950-000', 'Jacinto Machado', 'SC', 'BRASIL', 'Osvaldo saretto', 'Morissette Shoals', '1', NULL, 'App\\User', '14fde4a3-6f2d-457f-a01f-fe2e80b5c71e', 'published', NULL, '2020-03-05 17:25:06', '2020-03-05 17:25:06'),
('115db45c-5fbc-4db1-8a0e-712dff31b53a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\User', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'published', NULL, '2020-03-18 15:50:36', '2020-03-18 15:50:36'),
('9dbdbb63-dcaf-4d20-a7fe-e54ce2c3af0d', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Provider', '79f29f74-bf7c-409c-bedc-a250a57c1811', 'published', NULL, '2020-04-22 20:34:29', '2020-04-22 20:34:29'),
('180d8335-7810-4cd1-8bfb-f1d74d895c8e', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Provider', '1f935a98-d17b-4408-ae65-6c600b49952a', 'published', NULL, '2020-04-22 20:36:50', '2020-04-22 20:36:50'),
('be54228e-8eb5-42c5-8a87-2d54a3589b64', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Provider', '25051910-ff28-402b-9b68-ef5774bed0c7', 'published', NULL, '2020-04-22 20:38:07', '2020-04-22 20:38:07'),
('4fcb7f56-1dfc-420f-9b17-60ff3c51af3c', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Provider', '801b3395-016d-495d-ac99-2360c8c234a4', 'published', NULL, '2020-04-22 20:39:17', '2020-04-22 20:39:17'),
('127ccb45-1a46-40ec-8003-e419fbd19bb0', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Provider', 'd6b6a387-bd6f-47b3-b0d1-8b5736b7e650', 'published', NULL, '2020-04-22 20:39:59', '2020-04-22 20:39:59'),
('820122c3-87c6-4f87-bd22-c16d117f15c2', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Provider', 'b39d58ee-6934-4740-a383-50166edde21c', 'published', NULL, '2020-04-22 20:40:34', '2020-04-22 20:40:34'),
('b9fbac83-e4fc-4db8-8b2a-fd6f66ee5d1e', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\Provider', '73eac5f1-381a-490e-a962-b8db9a55cdf0', 'published', NULL, '2020-04-22 21:14:37', '2020-04-22 21:14:37'),
('26e403a6-caad-4d8a-8ed7-102394878b34', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', NULL, NULL, NULL, NULL, NULL, 'BRASIL', NULL, NULL, NULL, NULL, 'App\\User', 'c68a87be-0ece-4be3-a6c9-e48e99689514', 'published', NULL, '2020-04-22 21:39:59', '2020-04-22 21:39:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `companies`
--

CREATE TABLE `companies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assets` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `companies`
--

INSERT INTO `companies` (`id`, `assets`, `name`, `slug`, `email`, `phone`, `document`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`, `company_id`, `user_id`) VALUES
('b77a0401-a321-487d-979a-5db49f6d14dc', 'sistema.maxpremiumjeans.com.br', 'Max Premium', 'dr-sophie-lovato-dominato', 'contato@maxpremiumjeans.com.br', '(89) 4248-3264', '4621161056201099', 'Quae vitae et deserunt veritatis eius qui asperiores.', 'published', NULL, '2020-02-15 04:35:37', '2020-02-15 05:42:15', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL),
('58ee1067-9147-48de-9bad-8e2ea3775ca7', 'www.sistema.maxpremiumjeans.com.br', 'SIGA SMART SISTEMAS', 'siga-smart-sistemas', 'contato@sigasmart.com.br', NULL, NULL, 'Sistema integrado de gerenciamento e administração!!', 'published', NULL, '2020-05-26 10:38:58', '2020-05-26 10:38:58', '58ee1067-9147-48de-9bad-8e2ea3775ca7', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `files`
--

CREATE TABLE `files` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullPath` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '/dist/upload/images',
  `fileType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image/jpeg',
  `ext` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'jpg',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `fileable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `files`
--

INSERT INTO `files` (`id`, `company_id`, `user_id`, `name`, `fullPath`, `dir`, `fileType`, `ext`, `size`, `width`, `height`, `fileable_type`, `fileable_id`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
('8107b66b-d050-468f-a67a-82ed5449a9fd', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '1140042011-1582722510-headphone-1.jpeg', 'storage/products/202002/1140042011-1582722510-headphone-1.jpeg', '/dist/upload/images', 'image/jpeg', '', '22555', NULL, NULL, 'App\\Product', '8714dcd6-3c52-479a-b201-84e6327114a0', NULL, 'published', NULL, '2020-02-26 16:08:30', '2020-02-26 16:08:30'),
('cfb26174-97b8-42ad-9116-0af4b27535c7', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '1089106005-1587577487-1i5b1017.jpeg', 'storage/products/202004/1089106005-1587577487-1i5b1017.jpeg', '/dist/upload/images', 'image/jpeg', '', '5196213', NULL, NULL, 'App\\Product', 'cf5963f5-1de1-485b-ae9f-137a32423a24', NULL, 'published', NULL, '2020-04-22 20:44:47', '2020-04-22 20:44:47'),
('ec2d6f34-4a7c-4055-bf93-4dee3c7ecae8', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '1871251996-1587578845-logo-fundo-branco.png', 'storage/stocks/202004/1871251996-1587578845-logo-fundo-branco.png', '/dist/upload/images', 'image/png', '', '143496', NULL, NULL, 'App\\Fabric', '4c0c3675-3575-43c2-9b0c-bd92a9f6d530', NULL, 'published', NULL, '2020-04-22 21:07:25', '2020-04-22 21:07:25'),
('558a4380-3784-4f8c-98e4-3e3e31754ce6', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '778321446-1588186370-unnamed.jpeg', 'storage/stocks/202004/778321446-1588186370-unnamed.jpeg', '/dist/upload/images', 'image/jpeg', '', '76694', NULL, NULL, 'App\\Fabric', 'bf12fccf-57e4-4872-bfd9-4eb100e243a6', NULL, 'published', NULL, '2020-04-22 21:08:54', '2020-04-29 21:52:50'),
('f9c4e0b8-9649-4e69-8988-9dcd93b4594b', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '2133407733-1587579034-9.png', 'storage/stocks/202004/2133407733-1587579034-9.png', '/dist/upload/images', 'image/png', '', '695071', NULL, NULL, 'App\\Aviament', '34cecaed-a519-428e-be45-a9a499213e15', NULL, 'published', NULL, '2020-04-22 21:10:34', '2020-04-22 21:10:34'),
('8f9fce8f-efcc-4b45-a4b7-db24cb48687a', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '792793231-1587579127-18.png', 'storage/stocks/202004/792793231-1587579127-18.png', '/dist/upload/images', 'image/png', '', '952589', NULL, NULL, 'App\\Aviament', 'fd5ae87c-1425-475c-a638-088254f79e64', NULL, 'published', NULL, '2020-04-22 21:12:07', '2020-04-22 21:12:07'),
('abc30714-b1c1-41b8-93ef-acda11cf6bc2', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '720025403-1590777918-1.png', 'storage/products/202005/720025403-1590777918-1.png', '/dist/upload/images', 'image/png', '', '873676', NULL, NULL, 'App\\Product', '54c22175-4095-4ab2-a832-099b9cd38826', NULL, 'published', NULL, '2020-05-29 21:45:18', '2020-05-29 21:45:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grids`
--

CREATE TABLE `grids` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `grids`
--

INSERT INTO `grids` (`id`, `company_id`, `user_id`, `name`, `slug`, `description`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('b23a6617-4796-4f80-a7ee-556d9f49f4cb', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'grade 01', 'grade-01', 'descrição da grade 01', 'published', NULL, '2020-02-15 05:44:54', '2020-03-18 19:57:20', '2020-03-18 19:57:20'),
('38445341-05c1-44c3-8db4-ca9673dc668d', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Grade 02', 'grade-02', 'grade 02', 'published', NULL, '2020-03-10 21:50:13', '2020-03-18 19:57:23', '2020-03-18 19:57:23'),
('39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Grade 1', 'grade-1', NULL, 'published', NULL, '2020-04-22 21:03:45', '2020-06-29 22:11:07', NULL),
('c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Grade 2', 'grade-2', '38 ate 46', 'published', NULL, '2020-04-22 21:05:11', '2020-05-29 21:49:21', NULL),
('757bd317-2b2d-4cb0-9f1f-749d814ff534', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Grade 3', 'grade-3', NULL, 'published', NULL, '2020-05-29 23:48:57', '2020-05-29 23:48:57', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `grid_number`
--

CREATE TABLE `grid_number` (
  `grid_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `grid_number`
--

INSERT INTO `grid_number` (`grid_id`, `number_id`, `created_at`, `updated_at`) VALUES
('c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'c06394fe-9a48-4282-9a6f-71e7938471ea', NULL, NULL),
('c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', NULL, NULL),
('39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', NULL, NULL),
('c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', NULL, NULL),
('c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'fb62c5bc-d93c-4bf3-b08c-f03c0b244478', NULL, NULL),
('c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '81a96cd4-a6ef-42a8-b660-5a084accb2bb', NULL, NULL),
('757bd317-2b2d-4cb0-9f1f-749d814ff534', 'c06394fe-9a48-4282-9a6f-71e7938471ea', NULL, NULL),
('757bd317-2b2d-4cb0-9f1f-749d814ff534', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', NULL, NULL),
('757bd317-2b2d-4cb0-9f1f-749d814ff534', '81a96cd4-a6ef-42a8-b660-5a084accb2bb', NULL, NULL),
('757bd317-2b2d-4cb0-9f1f-749d814ff534', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `grid_order_items`
--

CREATE TABLE `grid_order_items` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grid_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `grid_order_items`
--

INSERT INTO `grid_order_items` (`id`, `company_id`, `user_id`, `order_id`, `grid_id`, `number_id`, `amount`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('24107e02-7346-4cf6-a107-31e27b8b7b97', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '98a0da43-91aa-404a-b63a-512b79d31f2d', '39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 6.00, NULL, 'published', '2020-04-29 18:01:55', '2020-04-29 18:02:14', NULL),
('db435ac4-2afc-4eed-b264-cf952e80951f', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '98a0da43-91aa-404a-b63a-512b79d31f2d', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 3.00, NULL, 'published', '2020-04-29 18:02:03', '2020-04-29 18:02:14', NULL),
('390ff5e7-6133-472b-bd59-461bdc4c5362', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '98a0da43-91aa-404a-b63a-512b79d31f2d', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'c06394fe-9a48-4282-9a6f-71e7938471ea', 10.00, NULL, 'published', '2020-04-29 18:02:03', '2020-04-29 18:02:27', NULL),
('a973ef8a-8236-4b2e-8b1e-ff6426232df1', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', '39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-04-29 21:27:01', '2020-04-29 21:45:39', '2020-04-29 21:45:39'),
('1b60ce77-f194-4b2d-90a2-08ad4f9cd740', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'c06394fe-9a48-4282-9a6f-71e7938471ea', 3.00, NULL, 'published', '2020-04-29 21:46:36', '2020-04-30 03:31:07', '2020-04-30 03:31:07'),
('083c69d1-0dee-4864-abe0-b3b60f4a8c55', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 8.00, NULL, 'published', '2020-04-29 21:46:36', '2020-04-30 03:30:54', '2020-04-30 03:30:54'),
('cece8df6-d1ff-406b-abcb-813ae04cd523', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', 7.00, NULL, 'published', '2020-04-29 21:46:36', '2020-04-30 03:30:59', '2020-04-30 03:30:59'),
('3c168774-873e-4905-8696-17a4fd48396c', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', '39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-04-30 03:30:46', '2020-04-30 03:31:04', '2020-04-30 03:31:04'),
('38ad893b-6e47-483e-ac12-28299868b861', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'c06394fe-9a48-4282-9a6f-71e7938471ea', 5.00, NULL, 'published', '2020-04-30 03:31:12', '2020-04-30 03:31:31', NULL),
('9daa9401-275e-4c20-b0d3-3478db60b369', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 5.00, NULL, 'published', '2020-04-30 03:31:12', '2020-04-30 03:31:31', NULL),
('5825a87d-eea2-437c-922d-3efed7938a69', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', 3.00, NULL, 'published', '2020-04-30 03:31:12', '2020-04-30 03:31:31', NULL),
('0893dc13-3368-4dad-8f83-2bfd82f6b459', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'fb62c5bc-d93c-4bf3-b08c-f03c0b244478', 1.00, NULL, 'published', '2020-04-30 03:31:12', '2020-04-30 03:31:31', NULL),
('1169fc72-a849-4141-8431-98ec8088b3df', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-05-29 21:54:18', '2020-05-29 22:00:12', '2020-05-29 22:00:12'),
('543a19da-cb15-4fe7-ac60-fe2ba0c53f22', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'c06394fe-9a48-4282-9a6f-71e7938471ea', 0.00, NULL, 'published', '2020-05-29 22:00:20', '2020-05-29 23:59:46', '2020-05-29 23:59:46'),
('8c73c038-1ff7-41c5-aaa9-ad74fe4e4b67', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-05-29 22:00:20', '2020-05-29 23:59:37', '2020-05-29 23:59:37'),
('ff40646d-879e-4a7e-a04f-47ebbc09dbae', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', 0.00, NULL, 'published', '2020-05-29 22:00:20', '2020-05-29 23:58:42', '2020-05-29 23:58:42'),
('7de22596-a96b-4e27-8b50-4fe50bba9bb6', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'fb62c5bc-d93c-4bf3-b08c-f03c0b244478', 0.00, NULL, 'published', '2020-05-29 22:00:20', '2020-05-29 23:59:41', '2020-05-29 23:59:41'),
('e8b06369-b548-4fd0-b329-6969572caf33', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '81a96cd4-a6ef-42a8-b660-5a084accb2bb', 0.00, NULL, 'published', '2020-05-29 22:00:20', '2020-05-29 23:58:49', '2020-05-29 23:58:49'),
('a8ffa2f2-8911-484b-8c1c-6a52889d403b', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '757bd317-2b2d-4cb0-9f1f-749d814ff534', 'c06394fe-9a48-4282-9a6f-71e7938471ea', 0.00, NULL, 'published', '2020-05-29 23:58:02', '2020-05-29 23:59:31', '2020-05-29 23:59:31'),
('1514ead9-1ffe-4cd7-be6b-b3d41b3e4492', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '757bd317-2b2d-4cb0-9f1f-749d814ff534', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-05-29 23:58:02', '2020-05-29 23:59:57', '2020-05-29 23:59:57'),
('047d2681-0f45-4e59-8e45-a49533e675fa', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '757bd317-2b2d-4cb0-9f1f-749d814ff534', '81a96cd4-a6ef-42a8-b660-5a084accb2bb', 0.00, NULL, 'published', '2020-05-29 23:58:02', '2020-05-30 00:00:01', '2020-05-30 00:00:01'),
('49204a08-64c2-4e1d-988a-32c452269c28', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '757bd317-2b2d-4cb0-9f1f-749d814ff534', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', 0.00, NULL, 'published', '2020-05-29 23:58:02', '2020-05-29 23:59:52', '2020-05-29 23:59:52'),
('1f4666d3-d6a3-4567-902d-877a41301dc2', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'c06394fe-9a48-4282-9a6f-71e7938471ea', 0.00, NULL, 'published', '2020-05-30 00:00:08', '2020-05-30 00:00:08', NULL),
('e0a2e460-185a-443f-92eb-d3b99d252bd7', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-05-30 00:00:08', '2020-05-30 00:00:08', NULL),
('3e257f04-50c1-4248-9a15-de7cbb7fbd88', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', 0.00, NULL, 'published', '2020-05-30 00:00:08', '2020-05-30 00:00:08', NULL),
('416623fd-bcc0-4748-96e6-8f62265be420', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'fb62c5bc-d93c-4bf3-b08c-f03c0b244478', 0.00, NULL, 'published', '2020-05-30 00:00:08', '2020-05-30 00:00:08', NULL),
('d7b1106a-79ea-4a72-b7ec-16996f7e1d88', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '81a96cd4-a6ef-42a8-b660-5a084accb2bb', 0.00, NULL, 'published', '2020-05-30 00:00:08', '2020-05-30 00:00:08', NULL),
('0f48c475-0f87-4520-9e8e-b570b932fb36', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e202a05f-bc61-4eb8-8e0e-397e501f3bec', '39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-06-29 22:24:56', '2020-06-29 22:25:11', '2020-06-29 22:25:11'),
('32f03c66-e54c-4788-b43e-9cccf204559c', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e202a05f-bc61-4eb8-8e0e-397e501f3bec', '39928ef3-1711-476a-83c6-3ad6c82dd5d9', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-06-29 22:25:16', '2020-06-29 22:25:23', '2020-06-29 22:25:23'),
('102fd01a-8967-47a1-91f8-cfca0c640763', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e202a05f-bc61-4eb8-8e0e-397e501f3bec', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'c06394fe-9a48-4282-9a6f-71e7938471ea', 0.00, NULL, 'published', '2020-06-29 22:25:32', '2020-06-29 22:25:32', NULL),
('0c48d3a4-ff66-4033-8d58-92366b1acf9d', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e202a05f-bc61-4eb8-8e0e-397e501f3bec', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 0.00, NULL, 'published', '2020-06-29 22:25:32', '2020-06-29 22:25:32', NULL),
('aab9a71d-574a-419c-94fa-1be8356ca703', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e202a05f-bc61-4eb8-8e0e-397e501f3bec', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '1bb499f2-4e2b-4e45-a9a5-4797beb7f549', 0.00, NULL, 'published', '2020-06-29 22:25:32', '2020-06-29 22:25:32', NULL),
('467985fe-b13f-4943-a818-b7f882ec3897', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e202a05f-bc61-4eb8-8e0e-397e501f3bec', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', 'fb62c5bc-d93c-4bf3-b08c-f03c0b244478', 0.00, NULL, 'published', '2020-06-29 22:25:32', '2020-06-29 22:25:32', NULL),
('1aa6fa77-4a22-4b8a-bfa8-c063c75f3736', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e202a05f-bc61-4eb8-8e0e-397e501f3bec', 'c74f8ff2-eec9-49c4-b6a3-7f0153c073f3', '81a96cd4-a6ef-42a8-b660-5a084accb2bb', 0.00, NULL, 'published', '2020-06-29 22:25:32', '2020-06-29 22:25:32', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `input_process_steps`
--

CREATE TABLE `input_process_steps` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stage_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `number_of_pieces` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `number_of_damaged_pieces` int(11) DEFAULT '0',
  `piece_value` decimal(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published','pause','feedstock','payment') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `input_process_steps`
--

INSERT INTO `input_process_steps` (`id`, `company_id`, `user_id`, `stage_id`, `provider_id`, `order_id`, `date`, `number_of_pieces`, `delivery_date`, `expected_delivery_date`, `number_of_damaged_pieces`, `piece_value`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
('2cfdefcd-9462-445b-9034-39039837c4d8', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '47d9de6e-9db5-4c14-876d-8168724b0828', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'e61da085-9228-49b1-9505-36ac5f77d07e', '2020-03-07', 45, NULL, '2020-03-08', 0, 8.00, 'Descrição da etapa 01', 'payment', NULL, '2020-03-07 03:57:34', '2020-03-07 03:59:04'),
('92e7e6e4-4d4f-4948-9235-0b9f5709f1e3', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'e61da085-9228-49b1-9505-36ac5f77d07e', '2020-03-07', 45, NULL, '2020-03-08', 0, 2.00, 'Descrição da Facção', 'payment', NULL, '2020-03-07 04:00:24', '2020-03-09 23:37:22'),
('612aefc3-b8aa-432d-ac09-8f36c374bc6f', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'ef246c3d-5284-4e72-aa07-8d6bdea2a056', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'e61da085-9228-49b1-9505-36ac5f77d07e', '2020-03-07', 45, NULL, '2020-03-08', 0, 5.00, 'Colocar x travets', 'published', NULL, '2020-03-07 04:03:04', '2020-03-07 04:04:28'),
('a56bd8b8-957f-42f3-a7fb-b4655c626138', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '47d9de6e-9db5-4c14-876d-8168724b0828', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', '2020-03-09', 1000, NULL, '2020-03-10', 5, 0.11, NULL, 'payment', NULL, '2020-03-09 20:19:54', '2020-03-09 20:23:24'),
('89d904cd-5011-48ca-87c9-eb199c1afb2a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', '2020-03-09', 995, NULL, '2020-03-10', 0, 1.00, NULL, 'payment', NULL, '2020-03-09 20:24:04', '2020-03-09 21:10:37'),
('5a201bf0-9092-422f-9c57-0a18cb8fe62c', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'ef246c3d-5284-4e72-aa07-8d6bdea2a056', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', '2020-03-09', 995, NULL, '2020-03-10', 20, 0.80, NULL, 'payment', NULL, '2020-03-09 21:10:56', '2020-03-09 21:11:24'),
('13ec1002-f7d0-46f1-ad12-70129696ebe0', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '9a83a88b-4828-43b5-9477-6ec51044871b', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', '2020-03-09', 975, NULL, '2020-03-10', 0, 1.00, NULL, 'payment', NULL, '2020-03-09 21:11:45', '2020-03-09 21:12:03'),
('2f0ef093-81e2-4133-8aec-232350473ce6', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '6cab47c1-da0d-406c-a0df-8576e423c4a3', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', '2020-03-09', 975, NULL, '2020-03-10', 10, 2.00, NULL, 'payment', NULL, '2020-03-09 21:12:23', '2020-03-09 21:12:47'),
('0b0d5a9a-3658-41c1-83b9-ef855b18e6c1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'f2f9a3b2-dd19-4649-9c97-aeba02db3db1', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', '2020-03-09', 965, NULL, '2020-03-10', 0, 1.00, NULL, 'payment', NULL, '2020-03-09 21:13:17', '2020-03-09 21:13:39'),
('4855d835-021d-4f46-b78d-69a6de04b704', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '9a83a88b-4828-43b5-9477-6ec51044871b', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'e61da085-9228-49b1-9505-36ac5f77d07e', '2020-03-09', 45, NULL, '2020-03-10', 0, 1.00, NULL, 'published', NULL, '2020-03-09 21:31:17', '2020-03-09 23:45:45'),
('cd79d2a3-0ccc-4e87-ba27-97b17b61e395', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '6cab47c1-da0d-406c-a0df-8576e423c4a3', 'd3536b80-0935-40cb-9e50-7b9fb950511c', 'e61da085-9228-49b1-9505-36ac5f77d07e', '2020-03-09', 45, NULL, '2020-03-10', 1, 1.00, 'Teste de descrição da etapa aqui da lavanderia', 'payment', NULL, '2020-03-09 23:46:26', '2020-03-09 23:47:27'),
('6c3d82f8-9fd2-4473-9c14-ecd499271457', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '47d9de6e-9db5-4c14-876d-8168724b0828', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '700cba89-4b94-49fe-9a79-9e8e8066aeb2', '2020-03-10', 100, NULL, '2020-03-23', 0, 2.00, 'Fazer cortes com reaproveitamento', 'payment', NULL, '2020-03-10 22:01:19', '2020-03-10 22:04:14'),
('16c4dac0-6373-4ff4-a90e-7af35f5813db', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '700cba89-4b94-49fe-9a79-9e8e8066aeb2', '2020-03-10', 100, NULL, '2020-03-11', 1, 1.50, 'Descrição da fACÇÃO', 'payment', NULL, '2020-03-10 22:09:48', '2020-03-18 16:09:10'),
('99c916d4-276e-47c6-8a6a-a8a4f0efacab', 'b77a0401-a321-487d-979a-5db49f6d14dc', '299e0511-8304-42af-90e2-6046cb79c99d', 'ef246c3d-5284-4e72-aa07-8d6bdea2a056', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '700cba89-4b94-49fe-9a79-9e8e8066aeb2', '2020-03-18', 99, NULL, '2020-03-19', 1, 5.00, 'desc', 'payment', NULL, '2020-03-18 16:24:39', '2020-03-18 16:25:48'),
('79ad410b-060c-4fcf-91db-992529b6a80d', 'b77a0401-a321-487d-979a-5db49f6d14dc', '299e0511-8304-42af-90e2-6046cb79c99d', '9a83a88b-4828-43b5-9477-6ec51044871b', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '700cba89-4b94-49fe-9a79-9e8e8066aeb2', '2020-03-18', 98, NULL, '2020-03-19', 0, 0.00, 'desc vaqui', 'draft', '2020-03-18 16:48:30', '2020-03-18 16:38:19', '2020-03-18 16:48:30'),
('732a4da0-47b3-439b-9bc4-95255c7b749a', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '47d9de6e-9db5-4c14-876d-8168724b0828', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '1d422a47-99e7-4634-8bf6-20011855c5e8', '2020-03-18', 60, NULL, '2020-03-29', 0, 2.00, 'Fazer cortes bem feito', 'payment', NULL, '2020-03-18 19:19:02', '2020-03-18 19:23:09'),
('f45642e8-ab6f-4b65-be62-c2fdce8e5cc2', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '1d422a47-99e7-4634-8bf6-20011855c5e8', '2020-03-18', 60, NULL, '2020-03-29', 5, 5.00, 'descrição da facção', 'payment', NULL, '2020-03-18 19:25:10', '2020-03-18 19:27:10'),
('b06062bd-005d-4559-bbbb-3c3be9fe2647', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', '98a0da43-91aa-404a-b63a-512b79d31f2d', '2020-04-22', 0, NULL, '2020-04-25', 0, 0.00, NULL, 'draft', '2020-04-22 22:52:20', '2020-04-22 22:48:12', '2020-04-22 22:52:20'),
('f62279e2-3d8a-44fd-973b-7e813b18fa79', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', '98a0da43-91aa-404a-b63a-512b79d31f2d', '2020-04-22', 0, NULL, '2020-04-25', 0, 0.30, NULL, 'draft', '2020-04-22 23:04:17', '2020-04-22 22:52:53', '2020-04-22 23:04:17'),
('3ee45c92-2e6e-40c0-8deb-1ce5562fdf2a', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', '98a0da43-91aa-404a-b63a-512b79d31f2d', '2020-04-22', 4, NULL, '2020-04-25', 0, 0.30, NULL, 'draft', '2020-04-23 00:39:56', '2020-04-22 23:04:55', '2020-04-23 00:39:56'),
('4e1e5f00-e7c5-42e0-8daf-14b55dc8d103', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', '79f29f74-bf7c-409c-bedc-a250a57c1811', '98a0da43-91aa-404a-b63a-512b79d31f2d', '2020-04-22', 10, NULL, '2020-04-23', 2, 5.00, NULL, 'published', NULL, '2020-04-23 00:54:56', '2020-04-29 21:55:34'),
('a041a640-d497-4a20-8a25-a3ba76b88988', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'ef246c3d-5284-4e72-aa07-8d6bdea2a056', '801b3395-016d-495d-ac99-2360c8c234a4', '98a0da43-91aa-404a-b63a-512b79d31f2d', '2020-04-29', 8, NULL, '2020-04-30', 0, 10.00, NULL, 'published', NULL, '2020-04-29 21:56:06', '2020-04-29 22:00:24'),
('7b76dbff-9a2d-4fd7-8b2c-110008f687df', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', '5b13290b-25c6-4791-a2c7-2ce612685e38', '2020-04-29', 55, NULL, '2020-04-30', 0, 4.00, NULL, 'published', NULL, '2020-04-29 22:03:29', '2020-04-30 03:33:54'),
('e3ae6832-6319-4390-91b0-828fe890fb18', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '9a83a88b-4828-43b5-9477-6ec51044871b', '25051910-ff28-402b-9b68-ef5774bed0c7', '5b13290b-25c6-4791-a2c7-2ce612685e38', '2020-04-30', 55, NULL, '2020-05-01', 2, 5.00, 'fazer diferenciado x', 'published', NULL, '2020-04-30 03:34:28', '2020-04-30 03:35:20'),
('e490f2d4-4125-4e79-a973-841533e67a74', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '6cab47c1-da0d-406c-a0df-8576e423c4a3', 'd6b6a387-bd6f-47b3-b0d1-8b5736b7e650', '5b13290b-25c6-4791-a2c7-2ce612685e38', '2020-04-30', 52, NULL, '2020-05-01', 0, 5.00, 'lavar vvvd', 'published', NULL, '2020-04-30 03:35:44', '2020-04-30 03:36:46'),
('f04bd992-f974-4253-8e3c-ccc507ca0a17', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 0, NULL, '2020-05-30', 0, 0.00, NULL, 'draft', '2020-05-29 22:13:07', '2020-05-29 22:06:31', '2020-05-29 22:13:07'),
('b7fd8b8b-77bb-4998-ac91-3586ac2b13d7', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 0, NULL, '2020-05-30', 0, 0.00, NULL, 'draft', '2020-05-29 23:56:49', '2020-05-29 22:13:41', '2020-05-29 23:56:49'),
('1d1d414f-6e94-4a4a-bc2f-0125fc5686b0', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 0, NULL, '2020-05-30', 0, 0.30, NULL, 'draft', '2020-05-30 00:08:58', '2020-05-30 00:05:06', '2020-05-30 00:08:58'),
('7b7a3189-f42e-43c9-8ee1-7999f3a4fc16', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '47d9de6e-9db5-4c14-876d-8168724b0828', '73eac5f1-381a-490e-a962-b8db9a55cdf0', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 180, NULL, '2020-05-30', 0, 0.30, NULL, 'payment', NULL, '2020-05-30 00:12:21', '2020-05-30 00:17:55'),
('d94732f6-17b4-4377-8533-ce462d6c38a9', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', '79f29f74-bf7c-409c-bedc-a250a57c1811', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 178, NULL, '2020-06-06', 0, 3.60, NULL, 'draft', '2020-05-30 00:35:03', '2020-05-30 00:21:34', '2020-05-30 00:35:03'),
('a3de3d7c-36e4-43a2-b1d3-574e443bea5c', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', '79f29f74-bf7c-409c-bedc-a250a57c1811', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 178, NULL, '2020-05-30', 2, 3.60, NULL, 'payment', NULL, '2020-05-30 00:35:20', '2020-05-30 00:37:23'),
('402b5447-223d-4160-b6ed-ca02212ace35', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'ef246c3d-5284-4e72-aa07-8d6bdea2a056', '801b3395-016d-495d-ac99-2360c8c234a4', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 174, NULL, '2020-05-30', 1, 0.32, NULL, 'payment', NULL, '2020-05-30 00:49:50', '2020-05-30 01:00:52'),
('6fa1c207-0903-4ac5-a8ec-d0c1ee5172b4', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '9a83a88b-4828-43b5-9477-6ec51044871b', '25051910-ff28-402b-9b68-ef5774bed0c7', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 173, NULL, '2020-05-30', NULL, 0.30, 'Bigode', 'published', NULL, '2020-05-30 01:06:22', '2020-05-30 01:08:29'),
('c2bfd6a7-cd81-4c14-adad-8d9ab293f7c6', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '6cab47c1-da0d-406c-a0df-8576e423c4a3', 'd6b6a387-bd6f-47b3-b0d1-8b5736b7e650', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 173, NULL, '2020-05-30', 0, 0.00, NULL, 'draft', '2020-05-30 01:10:05', '2020-05-30 01:09:09', '2020-05-30 01:10:05'),
('bbf0a795-ec03-4353-ac8e-3ade1ba78ebc', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '6cab47c1-da0d-406c-a0df-8576e423c4a3', 'd6b6a387-bd6f-47b3-b0d1-8b5736b7e650', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 173, NULL, '2020-05-30', 0, 0.00, NULL, 'draft', '2020-05-30 01:11:54', '2020-05-30 01:11:06', '2020-05-30 01:11:54'),
('20ba9ed0-5b76-40d8-ab2d-b4bfcc56433d', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '6cab47c1-da0d-406c-a0df-8576e423c4a3', 'd6b6a387-bd6f-47b3-b0d1-8b5736b7e650', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 173, NULL, '2020-06-03', 173, 6.00, NULL, 'published', NULL, '2020-05-30 01:12:47', '2020-05-30 01:15:40'),
('f1921f03-e558-44a5-a9cc-6399de1bbc8e', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'f2f9a3b2-dd19-4649-9c97-aeba02db3db1', '79f29f74-bf7c-409c-bedc-a250a57c1811', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-05-29', 0, NULL, '2020-05-30', 0, 0.00, NULL, 'draft', '2020-06-30 03:09:24', '2020-05-30 01:16:14', '2020-06-30 03:09:24'),
('e4198fd7-1a20-4c64-8bfd-2153ce68fae9', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'f2f9a3b2-dd19-4649-9c97-aeba02db3db1', '801b3395-016d-495d-ac99-2360c8c234a4', 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '2020-06-30', 0, NULL, '2020-07-01', 0, 0.00, NULL, 'draft', NULL, '2020-06-30 03:10:10', '2020-06-30 03:10:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `items`
--

CREATE TABLE `items` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fabric_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aviament_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assets` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'fabrics',
  `amount` decimal(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `items`
--

INSERT INTO `items` (`id`, `company_id`, `user_id`, `order_id`, `fabric_id`, `aviament_id`, `assets`, `amount`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('c726d3f7-daaa-40f5-9608-ec559969d2a2', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'fc1c99c6-fea6-45ab-aaac-67430a97c863', 'c2e0bbd8-8f41-4c1d-a993-8ec679d8e43f', NULL, 'fabrics', 40.00, NULL, 'published', '2020-03-05 22:34:48', '2020-03-05 22:58:36', '2020-03-05 22:58:36'),
('d90b6611-3ba2-4937-a913-0e8daa878c07', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'fc1c99c6-fea6-45ab-aaac-67430a97c863', '7a95028b-caab-4546-a239-5b705a2d2a33', NULL, 'fabrics', 2.00, NULL, 'published', '2020-03-05 22:35:08', '2020-03-05 22:36:40', '2020-03-05 22:36:40'),
('8d37e0b4-8949-4258-98d4-be623f4922a7', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'fc1c99c6-fea6-45ab-aaac-67430a97c863', 'ce72d6c7-2fe8-4a2f-ae3c-da8f8b384cb6', NULL, 'fabrics', 10.00, NULL, 'published', '2020-03-05 22:58:20', '2020-03-05 22:58:33', '2020-03-05 22:58:33'),
('03a52cfe-afb6-49c7-b860-6ef3d0c18856', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'fc1c99c6-fea6-45ab-aaac-67430a97c863', 'c2e0bbd8-8f41-4c1d-a993-8ec679d8e43f', NULL, 'fabrics', 1.00, NULL, 'published', '2020-03-05 22:58:51', '2020-03-05 22:58:51', NULL),
('3137eaa5-0790-42a2-81bb-2e7ff0143fc1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'fc1c99c6-fea6-45ab-aaac-67430a97c863', 'ce72d6c7-2fe8-4a2f-ae3c-da8f8b384cb6', NULL, 'fabrics', 4.00, NULL, 'published', '2020-03-05 22:59:01', '2020-03-06 21:04:17', '2020-03-06 21:04:17'),
('f1c59381-2793-48c1-ab26-0317762748e6', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'fc1c99c6-fea6-45ab-aaac-67430a97c863', NULL, 'afa7d223-5083-4fe6-87de-66f942ecf635', 'aviaments', 1.00, NULL, 'published', '2020-03-06 13:43:52', '2020-03-06 21:04:10', '2020-03-06 21:04:10'),
('94c807a1-e19d-403f-b599-5df67572b2ed', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '1d7b3337-d9ec-4564-8943-e490eddcbe9c', 'ce72d6c7-2fe8-4a2f-ae3c-da8f8b384cb6', NULL, 'fabrics', 17.00, NULL, 'published', '2020-03-06 21:05:29', '2020-03-07 01:52:02', NULL),
('ed5fd1d3-a4e9-493f-aa73-df71a653d843', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '1d7b3337-d9ec-4564-8943-e490eddcbe9c', NULL, 'afa7d223-5083-4fe6-87de-66f942ecf635', 'aviaments', 1.00, NULL, 'published', '2020-03-06 21:05:37', '2020-03-06 21:05:37', NULL),
('46232fbf-7f4c-4434-93a9-04d043c784c0', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'e61da085-9228-49b1-9505-36ac5f77d07e', '42346f62-80de-45c3-9807-4c53a2cb4fd1', NULL, 'fabrics', 10.00, NULL, 'published', '2020-03-07 03:56:50', '2020-03-09 21:27:30', NULL),
('946c720a-f0be-42b1-b699-651b938f040b', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'e61da085-9228-49b1-9505-36ac5f77d07e', NULL, '45fe459b-8586-44c3-9450-d88871f8f876', 'aviaments', 100.00, NULL, 'published', '2020-03-07 03:56:50', '2020-03-07 03:56:50', NULL),
('15832167-3752-4485-99e8-afe6711b22ab', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', '42346f62-80de-45c3-9807-4c53a2cb4fd1', NULL, 'fabrics', 1.00, NULL, 'published', '2020-03-09 20:18:42', '2020-03-09 20:18:42', NULL),
('6fcc10eb-795d-4c90-9d44-7d0024eb6ed8', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'ea809f9d-f342-4a3b-b708-158ad3c6c058', NULL, '45fe459b-8586-44c3-9450-d88871f8f876', 'aviaments', 2.00, NULL, 'published', '2020-03-09 20:18:49', '2020-03-09 20:18:49', NULL),
('b3f3579b-fdb0-4bb0-8475-c7034ad75688', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'f88efb65-2c89-44e6-8f83-3e71ca9fa26d', '42346f62-80de-45c3-9807-4c53a2cb4fd1', NULL, 'fabrics', 45.00, NULL, 'published', '2020-03-09 21:29:16', '2020-03-09 21:29:16', NULL),
('fbf842c0-b399-45e4-8b67-80536077982e', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'f88efb65-2c89-44e6-8f83-3e71ca9fa26d', NULL, '45fe459b-8586-44c3-9450-d88871f8f876', 'aviaments', 12.00, NULL, 'published', '2020-03-09 21:29:27', '2020-03-09 21:29:27', NULL),
('935d678b-397f-4f87-91d5-b156121bc0b5', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '700cba89-4b94-49fe-9a79-9e8e8066aeb2', '53c94fb9-fde3-40e5-83fd-9a786aab8e6f', NULL, 'fabrics', 2.00, NULL, 'published', '2020-03-10 21:59:11', '2020-03-10 21:59:11', NULL),
('0a35f678-6aa2-47fe-bbf2-881e757004d3', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '700cba89-4b94-49fe-9a79-9e8e8066aeb2', NULL, '45fe459b-8586-44c3-9450-d88871f8f876', 'aviaments', 200.00, NULL, 'published', '2020-03-10 21:59:34', '2020-03-10 21:59:34', NULL),
('d9e04f08-7ee5-45a1-8642-cb736efedb06', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '700cba89-4b94-49fe-9a79-9e8e8066aeb2', NULL, '1fadcd2d-06cb-4208-8b5b-133f41506885', 'aviaments', 21.00, NULL, 'published', '2020-03-10 21:59:48', '2020-03-10 22:00:28', NULL),
('9b71bbf5-21bb-45fa-b012-374b5049e1d1', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '1d422a47-99e7-4634-8bf6-20011855c5e8', '42346f62-80de-45c3-9807-4c53a2cb4fd1', NULL, 'fabrics', 2.00, NULL, 'published', '2020-03-18 19:14:59', '2020-03-18 19:15:37', '2020-03-18 19:15:37'),
('f9e1d5a3-ac38-4f3b-b69c-fbb4f3ea5301', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '1d422a47-99e7-4634-8bf6-20011855c5e8', '53c94fb9-fde3-40e5-83fd-9a786aab8e6f', NULL, 'fabrics', 1.00, NULL, 'published', '2020-03-18 19:15:10', '2020-03-18 19:15:10', NULL),
('b81471f9-6e62-43d3-9429-aa4b48be1564', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '1d422a47-99e7-4634-8bf6-20011855c5e8', NULL, '45fe459b-8586-44c3-9450-d88871f8f876', 'aviaments', 150.00, NULL, 'published', '2020-03-18 19:16:19', '2020-03-18 19:16:19', NULL),
('3d9af2a3-2763-4820-88e6-926d8a4ac467', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '98a0da43-91aa-404a-b63a-512b79d31f2d', '4c0c3675-3575-43c2-9b0c-bd92a9f6d530', NULL, 'fabrics', 15.00, NULL, 'published', '2020-04-22 21:21:03', '2020-04-23 00:43:00', NULL),
('92045a01-38c5-43e7-a23f-e4adbb7f2448', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '98a0da43-91aa-404a-b63a-512b79d31f2d', NULL, '07614add-b070-4f97-beca-5257723bf7db', 'aviaments', 5.00, NULL, 'published', '2020-04-22 21:21:03', '2020-04-22 23:20:39', NULL),
('0499e55a-a209-4655-ae6b-c678a48c2076', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '98a0da43-91aa-404a-b63a-512b79d31f2d', NULL, 'fd5ae87c-1425-475c-a638-088254f79e64', 'aviaments', 6.00, NULL, 'published', '2020-04-22 21:21:48', '2020-04-22 23:23:16', NULL),
('e5aa7b1b-a33f-4e3b-860d-0aabbc395e3d', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '98a0da43-91aa-404a-b63a-512b79d31f2d', NULL, '34cecaed-a519-428e-be45-a9a499213e15', 'aviaments', 4.00, NULL, 'published', '2020-04-22 21:22:01', '2020-04-22 21:22:01', NULL),
('efe5e2cb-ef47-42ba-84af-dc1096a0b170', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', '34cecaed-a519-428e-be45-a9a499213e15', NULL, 'fabrics', 19.00, NULL, 'published', '2020-04-28 21:57:54', '2020-04-29 21:48:07', '2020-04-29 21:48:07'),
('388e2b28-20ff-4a1a-87db-ff3b8491f309', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', NULL, '4c0c3675-3575-43c2-9b0c-bd92a9f6d530', 'aviaments', 1.00, NULL, 'published', '2020-04-28 21:57:54', '2020-04-29 21:50:11', '2020-04-29 21:50:11'),
('523b913a-4586-40bc-b0a7-88100b092324', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', '4c0c3675-3575-43c2-9b0c-bd92a9f6d530', NULL, 'fabrics', 9.00, NULL, 'published', '2020-04-29 21:48:37', '2020-04-30 03:32:04', NULL),
('f80058d8-29ee-41c7-aab3-bb01a36891e0', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', 'bf12fccf-57e4-4872-bfd9-4eb100e243a6', NULL, 'fabrics', 1.00, NULL, 'published', '2020-04-29 21:49:54', '2020-04-29 21:49:54', NULL),
('ee99ff41-0679-40f1-87ef-5e77fe5eb4e5', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', NULL, 'fd5ae87c-1425-475c-a638-088254f79e64', 'aviaments', 6.00, NULL, 'published', '2020-04-29 21:50:20', '2020-04-29 21:50:28', NULL),
('fb9fe677-a593-4565-b431-c3b813ce12c4', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '5b13290b-25c6-4791-a2c7-2ce612685e38', NULL, '34cecaed-a519-428e-be45-a9a499213e15', 'aviaments', 4.00, NULL, 'published', '2020-04-29 21:50:35', '2020-04-30 03:32:19', NULL),
('d1719fe5-e734-4f91-80be-36bccc363d1c', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', '57530d05-2ab2-404c-a233-b79c6493721e', NULL, 'fabrics', 2.00, NULL, 'published', '2020-05-29 21:55:02', '2020-05-30 00:02:15', NULL),
('11734cec-0b4b-48a1-bba6-a439959374e5', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', NULL, 'fd5ae87c-1425-475c-a638-088254f79e64', 'aviaments', 1.00, NULL, 'published', '2020-05-29 21:57:57', '2020-05-29 21:57:57', NULL),
('07adcd4e-c66e-4fa0-87cc-2643860eed16', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', NULL, '34cecaed-a519-428e-be45-a9a499213e15', 'aviaments', 4.00, NULL, 'published', '2020-05-29 21:58:14', '2020-05-29 21:58:21', NULL),
('15dfbef2-2648-41bb-b1f0-9308513b6d48', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', NULL, '07614add-b070-4f97-beca-5257723bf7db', 'aviaments', 1.00, NULL, 'published', '2020-05-29 21:58:33', '2020-05-29 21:58:33', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_12_13_123751_create_companies_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_13_123830_create_files_table', 1),
(6, '2019_12_13_125232_create_address_table', 1),
(7, '2019_12_15_023053_add_company_id_to_users', 1),
(8, '2019_12_15_023405_add_company_id_to_companies', 1),
(9, '2019_12_16_192210_create_activity_log_table', 1),
(10, '2019_12_19_174559_create_stored_routes_table', 1),
(11, '2019_12_23_173224_alter_table_user_add_fantasy_table', 1),
(12, '2020_02_06_120642_create_providers_table', 1),
(13, '2020_02_06_164429_create_grids_table', 1),
(14, '2020_02_06_164624_create_products_table', 1),
(15, '2020_02_11_104914_create_stocks_table', 1),
(16, '2020_02_12_212511_create_stages_table', 1),
(17, '2020_02_13_002410_create_orders_table', 1),
(18, '2020_02_13_122608_create_input_process_steps_table', 1),
(30, '2020_02_14_150652_create_payments_table', 3),
(20, '2021_01_20_084450_create_roles_table', 1),
(21, '2021_01_20_084525_create_role_user_table', 1),
(22, '2021_01_24_080208_create_permissions_table', 1),
(23, '2021_01_24_080433_create_permission_role_table', 1),
(24, '2021_12_04_003040_add_special_role_column', 1),
(25, '2021_12_17_121900_alter_permissions_add_to_group_table', 1),
(26, '2022_10_17_170735_create_permission_user_table', 1),
(28, '2020_02_12_150652_create_payments_table', 2),
(29, '2020_02_18_161741_create_items_table', 2),
(31, '2020_03_08_175845_alter_orders_add_to_product_id_table', 4),
(32, '2020_04_28_125243_alter_grids_add_to_numbers_table', 5),
(33, '2020_04_29_033647_create_numbers_table', 6),
(34, '2020_04_29_033711_create_grid_number_table', 6),
(35, '2020_04_29_034111_create_grid_order_items_table', 6),
(36, '2020_04_29_135902_alter_numbers_add_to_number_id_table', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `numbers`
--

CREATE TABLE `numbers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `numbers`
--

INSERT INTO `numbers` (`id`, `company_id`, `user_id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('e3e3c4a7-1e2d-43d6-aad4-74a65b34d93e', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '42', '42', 'published', '2020-04-29 18:01:00', '2020-04-29 18:01:00', NULL),
('c06394fe-9a48-4282-9a6f-71e7938471ea', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '44', '44', 'published', '2020-04-29 18:01:14', '2020-04-29 18:01:14', NULL),
('fb62c5bc-d93c-4bf3-b08c-f03c0b244478', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '46', '46', 'published', '2020-04-29 21:37:02', '2020-04-29 21:37:02', NULL),
('c83e5537-1a86-4afd-8928-4ff7445e8251', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '48', '48', 'published', '2020-04-29 21:37:21', '2020-04-29 21:37:21', NULL),
('81a96cd4-a6ef-42a8-b660-5a084accb2bb', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '40', '40', 'published', '2020-04-29 21:38:14', '2020-04-29 21:38:14', NULL),
('1bb499f2-4e2b-4e45-a9a5-4797beb7f549', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '38', '38', 'published', '2020-04-29 21:38:25', '2020-04-29 21:38:25', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsible_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` bigint(20) DEFAULT NULL,
  `grid_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fabric_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `differentiated` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `washed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observation` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id`, `company_id`, `user_id`, `responsible_id`, `codigo`, `grid_id`, `fabric_id`, `product_id`, `date`, `differentiated`, `line_color`, `washed`, `observation`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('e61da085-9228-49b1-9505-36ac5f77d07e', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '299e0511-8304-42af-90e2-6046cb79c99d', 1, 'b23a6617-4796-4f80-a7ee-556d9f49f4cb', NULL, '8714dcd6-3c52-479a-b201-84e6327114a0', '2020-03-07', 'fazer diferenciado xx', 'Vermelha', 'lavado a mão', 'Observações OS 01', 'Descrição OS 01', 'published', '2020-03-07 03:56:23', '2020-03-10 21:57:13', '2020-03-10 21:57:13'),
('ea809f9d-f342-4a3b-b708-158ad3c6c058', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '14fde4a3-6f2d-457f-a01f-fe2e80b5c71e', 2, 'b23a6617-4796-4f80-a7ee-556d9f49f4cb', NULL, '8714dcd6-3c52-479a-b201-84e6327114a0', '2020-03-09', 'diferenciado', 'azul', 'sim', NULL, NULL, 'published', '2020-03-09 20:18:32', '2020-03-09 23:36:37', '2020-03-09 23:36:37'),
('f88efb65-2c89-44e6-8f83-3e71ca9fa26d', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '299e0511-8304-42af-90e2-6046cb79c99d', 3, 'b23a6617-4796-4f80-a7ee-556d9f49f4cb', NULL, '8714dcd6-3c52-479a-b201-84e6327114a0', '2020-03-09', 'diferenciado', 'azul', 'sim', NULL, NULL, 'published', '2020-03-09 21:29:05', '2020-03-09 23:45:28', '2020-03-09 23:45:28'),
('700cba89-4b94-49fe-9a79-9e8e8066aeb2', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '299e0511-8304-42af-90e2-6046cb79c99d', 4, '38445341-05c1-44c3-8db4-ca9673dc668d', NULL, '8714dcd6-3c52-479a-b201-84e6327114a0', '2020-03-10', 'fazer diferenciado xx', 'amarelo', 'lavado a mão', 'Observação os 02', 'descrição os 02', 'published', '2020-03-10 21:58:56', '2020-03-18 19:56:31', '2020-03-18 19:56:31'),
('1d422a47-99e7-4634-8bf6-20011855c5e8', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '299e0511-8304-42af-90e2-6046cb79c99d', 5, '38445341-05c1-44c3-8db4-ca9673dc668d', NULL, '8714dcd6-3c52-479a-b201-84e6327114a0', '2020-03-18', 'fazer vcvcvhahpoi', NULL, NULL, 'obs', 'desc', 'published', '2020-03-18 19:14:35', '2020-03-18 19:56:35', '2020-03-18 19:56:35'),
('98a0da43-91aa-404a-b63a-512b79d31f2d', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'c68a87be-0ece-4be3-a6c9-e48e99689514', 6, '39928ef3-1711-476a-83c6-3ad6c82dd5d9', NULL, '0ebcd80b-e5f2-4d4f-b0ee-18fb22ad2f4c', '2020-04-22', 'Rasgo joelho', 'Linha principal mel - outras linha caqui', 'Destroi Pistolado', 'Lavar na Handle - Bigode laser', NULL, 'published', '2020-04-22 21:19:22', '2020-04-22 21:40:40', NULL),
('5b13290b-25c6-4791-a2c7-2ce612685e38', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '299e0511-8304-42af-90e2-6046cb79c99d', 7, '39928ef3-1711-476a-83c6-3ad6c82dd5d9', NULL, '0ebcd80b-e5f2-4d4f-b0ee-18fb22ad2f4c', '2020-04-28', 'fazer diferenciado', 'azul', 'lavado a mão', NULL, NULL, 'published', '2020-04-28 21:57:21', '2020-04-28 21:57:21', NULL),
('e2b7aaa9-fc1d-4a75-b7c9-c5a895dfbf51', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'c68a87be-0ece-4be3-a6c9-e48e99689514', 8, NULL, NULL, '0ebcd80b-e5f2-4d4f-b0ee-18fb22ad2f4c', '2020-05-29', 'Rasgo joelho', 'Linha principal mel', NULL, NULL, NULL, 'published', '2020-05-29 21:53:50', '2020-05-29 21:53:50', NULL),
('e202a05f-bc61-4eb8-8e0e-397e501f3bec', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '1021ff71-bb91-4b20-a965-6c95378250b8', 9, NULL, NULL, '0ebcd80b-e5f2-4d4f-b0ee-18fb22ad2f4c', '2020-06-29', 'fazer diferenciado xx', 'amarelo', 'lavado a mão', NULL, NULL, 'published', '2020-06-29 22:24:46', '2020-06-29 22:24:46', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('callcocam@gmail.com', '$2y$10$QcZJmUkR0bsi8HQBiF398.PNEMYGnRIl3WfDszvWMhGEmVbfNDaku', '2020-03-05 17:36:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `payments`
--

CREATE TABLE `payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_process_step_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `payments`
--

INSERT INTO `payments` (`id`, `company_id`, `user_id`, `input_process_step_id`, `provider_id`, `payment_date`, `price`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('8fa4ce5d-e21a-406b-abc9-aeb85a5ac1e7', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '2cfdefcd-9462-445b-9034-39039837c4d8', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-06', 360.00, 'Conta referente a ordem de serviço código -1- da etapa -Corte!', 'draft', '2020-03-07 03:59:04', '2020-03-10 21:57:40', '2020-03-10 21:57:40'),
('2d51755d-820c-4e3a-8bed-6ea6ee33bab7', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'a56bd8b8-957f-42f3-a7fb-b4655c626138', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 109.45, 'Conta referente a ordem de serviço código -2- da etapa -Corte!', 'draft', '2020-03-09 20:23:24', '2020-03-09 23:34:44', '2020-03-09 23:34:44'),
('54e9de13-2a39-4914-80c4-26366ce98de7', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '89d904cd-5011-48ca-87c9-eb199c1afb2a', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 995.00, 'Conta referente a ordem de serviço código -2- da etapa -Facção!', 'draft', '2020-03-09 21:10:37', '2020-03-09 23:34:49', '2020-03-09 23:34:49'),
('ee9ee00e-3365-486d-b049-bdf6c71f77c5', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '5a201bf0-9092-422f-9c57-0a18cb8fe62c', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 780.00, 'Conta referente a ordem de serviço código -2- da etapa -Travet!', 'published', '2020-03-09 21:11:24', '2020-03-10 21:57:57', '2020-03-10 21:57:57'),
('5aa8d9e4-c708-47b1-959f-e7f73f9ecdd6', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '13ec1002-f7d0-46f1-ad12-70129696ebe0', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 975.00, 'Conta referente a ordem de serviço código -2- da etapa -Diferenciado!', 'draft', '2020-03-09 21:12:03', '2020-03-10 21:57:35', '2020-03-10 21:57:35'),
('70e41a0c-cbc7-4585-8985-bf029c5550c4', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '2f0ef093-81e2-4133-8aec-232350473ce6', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 1930.00, 'Conta referente a ordem de serviço código -2- da etapa -Lavanderia!', 'draft', '2020-03-09 21:12:47', '2020-03-10 21:57:44', '2020-03-10 21:57:44'),
('a95b26fd-8b10-45b3-9244-99cc82591e1c', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '0b0d5a9a-3658-41c1-83b9-ef855b18e6c1', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 965.00, 'Conta referente a ordem de serviço código -2- da etapa -Final!', 'published', '2020-03-09 21:13:39', '2020-03-10 21:57:53', '2020-03-10 21:57:53'),
('99884296-fdb8-4195-84b6-b7039b270c56', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '92e7e6e4-4d4f-4948-9235-0b9f5709f1e3', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 90.00, 'Conta referente a ordem de serviço código -1- da etapa -Facção!', 'draft', '2020-03-09 23:37:22', '2020-03-10 21:57:49', '2020-03-10 21:57:49'),
('13a1551b-b2ff-4db4-a31f-a84e00b3a061', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'cd79d2a3-0ccc-4e87-ba27-97b17b61e395', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-08', 44.00, 'Conta referente a ordem de serviço código -1- da etapa -Lavanderia!', 'draft', '2020-03-09 23:47:27', '2020-03-10 21:53:40', '2020-03-10 21:53:40'),
('ca1c438c-4d6d-4aff-90b8-34dab0974a9e', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', '6c3d82f8-9fd2-4473-9c14-ecd499271457', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-09', 200.00, 'Conta referente a ordem de serviço código -4- da etapa -Corte!', 'draft', '2020-03-10 22:04:14', '2020-03-18 19:56:50', '2020-03-18 19:56:50'),
('421f0b12-bea1-4b33-a200-c7ce407b750f', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '16c4dac0-6373-4ff4-a90e-7af35f5813db', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-17', 148.50, 'Conta referente a ordem de serviço código -4- da etapa -Facção!', 'draft', '2020-03-18 16:09:10', '2020-03-18 19:56:42', '2020-03-18 19:56:42'),
('a2fde2d7-48bc-4d94-9710-e3eb591b12ba', 'b77a0401-a321-487d-979a-5db49f6d14dc', '299e0511-8304-42af-90e2-6046cb79c99d', '99c916d4-276e-47c6-8a6a-a8a4f0efacab', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-17', 490.00, 'Conta referente a ordem de serviço código -4- da etapa -Travet!', 'draft', '2020-03-18 16:25:48', '2020-03-18 19:56:53', '2020-03-18 19:56:53'),
('81f3cc70-ec4d-498a-87d9-c80b053651aa', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '732a4da0-47b3-439b-9bc4-95255c7b749a', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-17', 120.00, 'Conta referente a ordem de serviço código -5- da etapa -Corte!', 'draft', '2020-03-18 19:23:09', '2020-03-18 19:56:56', '2020-03-18 19:56:56'),
('d676afd2-e5d6-453b-94a3-193b8d037cd3', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'f45642e8-ab6f-4b65-be62-c2fdce8e5cc2', 'd3536b80-0935-40cb-9e50-7b9fb950511c', '2020-04-17', 275.00, 'Conta referente a ordem de serviço código -5- da etapa -Facção!', 'draft', '2020-03-18 19:27:10', '2020-03-18 19:56:46', '2020-03-18 19:56:46'),
('056087cc-d91c-40ad-9f76-a4d7ab6b9daa', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '7b7a3189-f42e-43c9-8ee1-7999f3a4fc16', '73eac5f1-381a-490e-a962-b8db9a55cdf0', '2020-06-28', 54.00, 'Conta referente a ordem de serviço código -8- da etapa -Corte!', 'draft', '2020-05-30 00:17:55', '2020-05-30 00:17:55', NULL),
('6f817db4-f84c-4fc0-b788-5e7cfae78cf5', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'a3de3d7c-36e4-43a2-b1d3-574e443bea5c', '79f29f74-bf7c-409c-bedc-a250a57c1811', '2020-06-28', 633.60, 'Conta referente a ordem de serviço código -8- da etapa -Facção!', 'draft', '2020-05-30 00:37:23', '2020-05-30 00:37:23', NULL),
('10e6d6bf-f5b2-4a28-8b76-5a8ad47f3e6c', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, '402b5447-223d-4160-b6ed-ca02212ace35', '801b3395-016d-495d-ac99-2360c8c234a4', '2020-06-28', 55.36, 'Conta referente a ordem de serviço código -8- da etapa -Travet!', 'draft', '2020-05-30 01:00:52', '2020-05-30 01:00:52', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groups` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'index',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `company_id`, `user_id`, `name`, `slug`, `groups`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
('8d5f1b9d-a7b4-4394-aa77-31d1d30fbdc0', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.admin.index', 'admin.admin.index', 'index', 'Admin Admin Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('909f188c-0ae8-4d9d-802a-bc82a1fbb78f', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.settings.setting', 'admin.settings.setting', 'setting', 'Admin Settings Setting', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('1c11225b-5673-4af0-b11f-31f9cd2695e7', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.order-delete-item.destroy', 'admin.order-delete-item.destroy', 'destroy', 'Admin Order-Delete-Item Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('9289f38b-43f6-49fb-8029-b337db6a0b53', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.order-delete-stage.destroy', 'admin.order-delete-stage.destroy', 'destroy', 'Admin Order-Delete-Stage Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('3d9ed8e7-7bcf-4718-bcad-c0c5b1cada23', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.index', 'admin.users.index', 'index', 'Admin Users Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('a0109472-a847-4458-a9f8-6d8ba1c001a2', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.create', 'admin.users.create', 'create', 'Admin Users Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('ee0c2bf9-72c7-4c18-bb71-fa06e9c0bca4', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.show', 'admin.users.show', 'show', 'Admin Users Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('17cf8189-5e71-410c-acd3-ca065233564b', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.edit', 'admin.users.edit', 'edit', 'Admin Users Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('6155ceab-fee2-4f92-8b19-5af77640a5f5', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.update', 'admin.users.update', 'update', 'Admin Users Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('99cc8651-8d49-4a35-8f76-fab02cdb9706', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.destroy', 'admin.users.destroy', 'destroy', 'Admin Users Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('3293bc53-b035-402a-a0c4-90e5f9bd797a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.print', 'admin.users.print', 'print', 'Admin Users Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('deea13dd-837c-4bfc-958f-c323e726aabb', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.users.find', 'admin.users.find', 'find', 'Admin Users Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('b1f03b5d-fd11-41de-abff-23b3995d4c91', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.index', 'admin.companies.index', 'index', 'Admin Companies Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('61299cfb-6218-4c37-9fcf-6308bea16307', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.create', 'admin.companies.create', 'create', 'Admin Companies Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('d31f0c5b-74fa-4212-9125-67fb3579c498', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.show', 'admin.companies.show', 'show', 'Admin Companies Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('41d6d43e-122b-4c83-af2e-d608caae6ed2', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.edit', 'admin.companies.edit', 'edit', 'Admin Companies Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('35ce3dd1-5de3-4d33-891a-1533af6d431a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.update', 'admin.companies.update', 'update', 'Admin Companies Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('30eb45fd-a109-4dbf-a12b-563118a264e0', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.destroy', 'admin.companies.destroy', 'destroy', 'Admin Companies Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('6193cee4-aee3-4b19-8fe8-32559d8093dc', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.print', 'admin.companies.print', 'print', 'Admin Companies Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('721725e4-21ee-4ae7-a1f1-16ef737034a9', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.companies.find', 'admin.companies.find', 'find', 'Admin Companies Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('c12dd0b8-1546-4305-b862-6fcbb8728590', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.index', 'admin.providers.index', 'index', 'Admin Providers Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('a01b989d-4036-465d-8dfe-35d0e9e7945a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.create', 'admin.providers.create', 'create', 'Admin Providers Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('41c117f9-0a4e-4d11-b95a-b5addcdfc09a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.show', 'admin.providers.show', 'show', 'Admin Providers Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('ffa32fb6-58c3-4c91-aa10-9e973ac372e5', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.edit', 'admin.providers.edit', 'edit', 'Admin Providers Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('68af8771-3d19-43d6-bc13-b5fa5692c198', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.update', 'admin.providers.update', 'update', 'Admin Providers Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('99049c67-26d8-430f-b2a9-69cccf6f293a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.destroy', 'admin.providers.destroy', 'destroy', 'Admin Providers Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('1842ad21-2712-403a-9b9f-1f42829c56f9', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.print', 'admin.providers.print', 'print', 'Admin Providers Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('e87691ab-438d-482e-9313-446f63a7269d', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.providers.find', 'admin.providers.find', 'find', 'Admin Providers Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('1c4e9725-62f7-499b-a17b-1943e800cdb1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.index', 'admin.grids.index', 'index', 'Admin Grids Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('d1dbffef-ed81-4a9e-ae5c-ee0160d82d5d', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.create', 'admin.grids.create', 'create', 'Admin Grids Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('a3ad8d0d-924f-4012-a44c-300bf7d3f317', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.show', 'admin.grids.show', 'show', 'Admin Grids Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('71ad5626-95f3-4911-b8d4-c8a35413c52d', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.edit', 'admin.grids.edit', 'edit', 'Admin Grids Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('786a5ee6-0afa-442f-90e1-e1c9ca046d07', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.update', 'admin.grids.update', 'update', 'Admin Grids Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('db9076b0-d250-4c10-948d-e42ab4951c59', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.destroy', 'admin.grids.destroy', 'destroy', 'Admin Grids Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('4497a060-51ea-477e-9028-8f04e56f91d1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.print', 'admin.grids.print', 'print', 'Admin Grids Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('f7871b6d-0e28-411d-807a-a9561916ad25', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.grids.find', 'admin.grids.find', 'find', 'Admin Grids Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('ccc238d1-9f9c-41bb-8d8b-9b409dfece34', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.index', 'admin.products.index', 'index', 'Admin Products Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('cd8e1b16-ffec-446a-a36b-d7e688e6a21b', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.create', 'admin.products.create', 'create', 'Admin Products Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('a1ba7572-64ff-4c95-8d0d-71815dee3e41', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.show', 'admin.products.show', 'show', 'Admin Products Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('c517e179-8bd5-4cca-8e54-07fe63c38227', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.edit', 'admin.products.edit', 'edit', 'Admin Products Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('c4df938b-7c6a-40b8-b0f5-ab2dd6b68e70', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.update', 'admin.products.update', 'update', 'Admin Products Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('6f8d816f-0251-4a73-9db7-acb3a8ac0305', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.destroy', 'admin.products.destroy', 'destroy', 'Admin Products Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('e9b00fb3-e6f5-4315-8e46-f69e63fba80e', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.print', 'admin.products.print', 'print', 'Admin Products Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('4d62ed2a-c08a-4ecd-bdb0-6b9282346214', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.products.find', 'admin.products.find', 'find', 'Admin Products Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('50669dcf-06e2-419b-9869-56e0051e55ba', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.index', 'admin.aviaments.index', 'index', 'Admin Aviaments Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('a17c9419-7ea5-4a1f-83eb-d46b5494877b', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.create', 'admin.aviaments.create', 'create', 'Admin Aviaments Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('37fadf84-ecca-4994-9424-3a3a6dcffdb1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.show', 'admin.aviaments.show', 'show', 'Admin Aviaments Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('4bdbcde4-2a07-492f-8cad-eb5887e6f233', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.edit', 'admin.aviaments.edit', 'edit', 'Admin Aviaments Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('50f8d609-00e6-45e2-b683-e5c4eeed9f32', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.update', 'admin.aviaments.update', 'update', 'Admin Aviaments Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('09169b31-e0cb-4e5e-84cd-7777c6586ed7', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.destroy', 'admin.aviaments.destroy', 'destroy', 'Admin Aviaments Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('15db1f6c-ac62-4a40-87e5-1e61d8e3bba6', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.print', 'admin.aviaments.print', 'print', 'Admin Aviaments Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('3d47c008-92fe-4732-bff7-8d3fe0e81c28', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.aviaments.find', 'admin.aviaments.find', 'find', 'Admin Aviaments Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('25b2c009-6c94-4774-a0dd-64afcd6bd3d7', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.index', 'admin.fabrics.index', 'index', 'Admin Fabrics Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('1653618f-f1b6-417e-8f5a-854b9c565a8a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.create', 'admin.fabrics.create', 'create', 'Admin Fabrics Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('fba85570-3865-425e-8164-578ff8ca5ef1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.show', 'admin.fabrics.show', 'show', 'Admin Fabrics Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('a7b73709-9270-4027-a665-e95170e3dff8', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.edit', 'admin.fabrics.edit', 'edit', 'Admin Fabrics Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('a916bb38-10d4-4f27-a3a2-bd4e3bbc3500', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.update', 'admin.fabrics.update', 'update', 'Admin Fabrics Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('fce4c836-4bc2-4a66-9209-a49d86ab980f', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.destroy', 'admin.fabrics.destroy', 'destroy', 'Admin Fabrics Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('44e73a15-c072-4781-b680-07e1ee3500d3', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.print', 'admin.fabrics.print', 'print', 'Admin Fabrics Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('290e3394-6c40-446b-9431-70af3836e167', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.fabrics.find', 'admin.fabrics.find', 'find', 'Admin Fabrics Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('1e1779ae-5586-44a7-8518-7ae8d4e5c2be', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.index', 'admin.payments.index', 'index', 'Admin Payments Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('3d6e9f27-518e-401d-9ea7-ba73d3be4b06', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.create', 'admin.payments.create', 'create', 'Admin Payments Create', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('7db5a33e-d3da-41ad-9313-d9d2a1f8c405', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.show', 'admin.payments.show', 'show', 'Admin Payments Show', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('d30a1044-6f1b-4953-9e25-d95fbcac4b21', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.edit', 'admin.payments.edit', 'edit', 'Admin Payments Edit', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('70faff17-71cf-425f-9bac-a29dfe880c79', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.update', 'admin.payments.update', 'update', 'Admin Payments Update', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('28b9de03-fedf-49ec-bf1d-43b30ef67827', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.destroy', 'admin.payments.destroy', 'destroy', 'Admin Payments Destroy', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('3b4ab6c5-10e7-41f0-aad7-0187dccd7fea', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.print', 'admin.payments.print', 'print', 'Admin Payments Print', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('8a5dd08f-9eb5-4b79-a8fa-62e7ca81520a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.payments.find', 'admin.payments.find', 'find', 'Admin Payments Find', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('933f0cea-d9de-4443-8587-23dd11946781', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.index', 'admin.stages.index', 'index', 'Admin Stages Index', 'published', NULL, '2020-03-11 00:02:23', '2020-03-11 00:02:23'),
('75b1b9ca-4f6e-4c15-aae3-41e76cb4445e', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.create', 'admin.stages.create', 'create', 'Admin Stages Create', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('ffcd94ce-0a4f-40b7-a6e1-7289bf80759a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.show', 'admin.stages.show', 'show', 'Admin Stages Show', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('b8f99d40-f6f9-472a-8cb3-0f179862a753', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.edit', 'admin.stages.edit', 'edit', 'Admin Stages Edit', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('ee134be8-d15a-4878-981f-017b35a8c7a8', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.update', 'admin.stages.update', 'update', 'Admin Stages Update', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('0e5d18ab-1913-4fa8-b5b8-53e7dc844bae', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.destroy', 'admin.stages.destroy', 'destroy', 'Admin Stages Destroy', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('20c5e849-c31f-49b3-ae5a-fa3119bba4f0', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.print', 'admin.stages.print', 'print', 'Admin Stages Print', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('db93014c-9e3d-4b79-bcf6-4fe3687fa3b3', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.stages.find', 'admin.stages.find', 'find', 'Admin Stages Find', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('27dc7613-41dd-4c38-848d-a735c46602bc', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.index', 'admin.items.index', 'index', 'Admin Items Index', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('74357f5f-247e-477f-860e-8f2c83a8b5e0', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.create', 'admin.items.create', 'create', 'Admin Items Create', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('43e22e94-7b1e-4d52-9860-ce443c26d532', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.show', 'admin.items.show', 'show', 'Admin Items Show', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('697df663-dafa-4767-a9c4-655ace8e6cae', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.edit', 'admin.items.edit', 'edit', 'Admin Items Edit', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('37220eed-c15e-4c9c-9e82-ce975acb47e6', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.update', 'admin.items.update', 'update', 'Admin Items Update', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('fca5bb8e-8f70-4e2e-a00e-2c76fe314d34', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.destroy', 'admin.items.destroy', 'destroy', 'Admin Items Destroy', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('9e7cadef-5a97-4d3e-89fd-a7944211a86a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.print', 'admin.items.print', 'print', 'Admin Items Print', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('79dd8801-7c1a-42df-8346-4a16d6b394d1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.items.find', 'admin.items.find', 'find', 'Admin Items Find', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('7651e190-904a-4ba2-8536-1ee89c2f4e95', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.index', 'admin.orders.index', 'index', 'Admin Orders Index', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('c10035c4-3b9a-450c-b272-8f0f5bf8846d', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.create', 'admin.orders.create', 'create', 'Admin Orders Create', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('3bd6fedd-4cc8-407f-8d91-dcd749bcbd8f', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.show', 'admin.orders.show', 'show', 'Admin Orders Show', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('00734d2f-97b0-48c3-b8a9-48da3efaa568', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.edit', 'admin.orders.edit', 'edit', 'Admin Orders Edit', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('222de983-9ab0-44a9-9ed7-0c59c47a2718', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.update', 'admin.orders.update', 'update', 'Admin Orders Update', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('3aa30403-955c-4a76-9957-a6acf4f087e5', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.destroy', 'admin.orders.destroy', 'destroy', 'Admin Orders Destroy', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('d1696855-b0e6-4b58-8431-2c964daa1f4e', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.print', 'admin.orders.print', 'print', 'Admin Orders Print', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('ce59e900-328e-4d4c-8e7f-23d5e418bb83', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.orders.find', 'admin.orders.find', 'find', 'Admin Orders Find', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('4812ff75-1c69-4b9b-9d63-33579c419694', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.index', 'admin.inputs.index', 'index', 'Admin Inputs Index', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('499f140b-e179-4c73-8720-cf5a33a1c296', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.create', 'admin.inputs.create', 'create', 'Admin Inputs Create', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('97dc55d4-7cab-42fd-b610-5cb9cb78972e', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.show', 'admin.inputs.show', 'show', 'Admin Inputs Show', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('a68e6b8e-11e6-4456-bfae-055bfb4c8fdb', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.edit', 'admin.inputs.edit', 'edit', 'Admin Inputs Edit', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('2ae605c2-0768-43d9-9878-c8b73d2c6b2a', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.update', 'admin.inputs.update', 'update', 'Admin Inputs Update', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('ecc7b6a9-e24e-45c0-bcce-35e97e661bd5', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.destroy', 'admin.inputs.destroy', 'destroy', 'Admin Inputs Destroy', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('f6675c74-7c0f-47ae-ad73-c5f9bbffa315', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.print', 'admin.inputs.print', 'print', 'Admin Inputs Print', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('ad63afd7-e77d-4539-ae5b-06888229aabf', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'admin.inputs.find', 'admin.inputs.find', 'find', 'Admin Inputs Find', 'published', NULL, '2020-03-11 00:02:24', '2020-03-11 00:02:24'),
('1287fc7c-ca5b-432d-82c4-8b9228cc0d76', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.numbers.index', 'adminnumbersindex', 'index', NULL, 'published', NULL, '2020-04-29 21:35:18', '2020-04-29 21:35:18'),
('46eb08bd-aab7-4741-912e-69f95ce0bb6e', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.numbers.create', 'adminnumberscreate', 'create', NULL, 'published', NULL, '2020-04-29 21:35:43', '2020-04-29 21:35:43'),
('a938cbac-6db7-4f52-8210-b3f626c13f67', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.numbers.edit', 'adminnumbersedit', 'edit', NULL, 'published', NULL, '2020-04-29 21:36:03', '2020-04-29 21:36:03'),
('ec607834-b904-403f-b1a2-82bd96db10e3', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.order-delete-item-grid.destroy', 'adminorder-delete-item-griddestroy', 'destroy', NULL, 'published', NULL, '2020-04-29 21:40:40', '2020-04-29 21:40:40'),
('a62ef9a9-ce95-4135-b224-d012174305c5', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.numbers.show', 'adminnumbersshow', 'show', NULL, 'published', NULL, '2020-04-29 21:40:59', '2020-04-29 21:40:59'),
('4e1b6ee2-567e-46b8-af41-b2247bf9a3d5', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.numbers.update', 'adminnumbersupdate', 'update', NULL, 'published', NULL, '2020-04-29 21:41:15', '2020-04-29 21:41:15'),
('90972878-a619-4574-aca0-002adce244cd', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.numbers.destroy', 'adminnumbersdestroy', 'destroy', NULL, 'published', NULL, '2020-04-29 21:41:33', '2020-04-29 21:41:33'),
('88449e61-c137-4af9-a71b-41b03574d707', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-grids.index', 'adminorders-gridsindex', 'index', NULL, 'published', NULL, '2020-04-29 21:41:54', '2020-04-29 21:41:54'),
('f5b363dc-1d17-4c19-8b07-65eedb2246ec', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-grids.destroy', 'adminorders-gridsdestroy', 'destroy', NULL, 'published', NULL, '2020-04-29 21:42:19', '2020-04-29 21:42:19'),
('c8598414-5a64-4a70-9470-04e3045fe660', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-grids.edit', 'adminorders-gridsedit', 'edit', NULL, 'published', NULL, '2020-04-29 21:43:02', '2020-04-29 21:43:02'),
('fa5e11e5-4eb7-4d6a-92e0-3365a7456aa7', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-grids.create', 'adminorders-gridscreate', 'create', NULL, 'published', NULL, '2020-04-29 21:43:17', '2020-04-29 21:43:17'),
('b1bef097-de5a-4433-9c5e-23daaedb8240', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-grids.show', 'adminorders-gridsshow', 'show', NULL, 'published', NULL, '2020-04-29 21:43:32', '2020-04-29 21:43:32'),
('691eb369-d3be-4268-b407-cb90d2679a97', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-grids.update', 'adminorders-gridsupdate', 'update', NULL, 'published', NULL, '2020-04-29 21:43:45', '2020-04-29 21:43:45'),
('6b78fda5-7d5a-4d11-99c6-ff3e416af07e', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-fabrics.index', 'adminorders-fabricsindex', 'index', NULL, 'published', NULL, '2020-04-29 21:43:56', '2020-04-29 21:43:56'),
('526bb351-fbd3-454c-b41c-0e1edb36db11', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-fabrics.destroy', 'adminorders-fabricsdestroy', 'destroy', NULL, 'published', NULL, '2020-04-29 21:44:26', '2020-04-29 21:44:26'),
('644f0671-212f-4493-8e7b-803d365e1b5e', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-aviaments.destroy', 'adminorders-aviamentsdestroy', 'destroy', NULL, 'published', NULL, '2020-04-29 21:44:40', '2020-04-29 21:44:40'),
('32315f40-65f2-4307-8dab-94ef046cc1c3', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-fabrics.create', 'adminorders-fabricscreate', 'create', NULL, 'published', NULL, '2020-04-29 22:07:44', '2020-04-29 22:07:44'),
('6ccfbf09-eecf-4b3c-b1df-c7006a404b8e', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-fabrics.show', 'adminorders-fabricsshow', 'show', NULL, 'published', NULL, '2020-04-29 22:08:00', '2020-04-29 22:08:00'),
('515a1a6a-5302-4dc4-a2c6-280e2003195f', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-fabrics.edit', 'adminorders-fabricsedit', 'edit', NULL, 'published', NULL, '2020-04-29 22:08:14', '2020-04-29 22:08:14'),
('af582e73-2524-4711-b7fb-300ee39d1690', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-fabrics.update', 'adminorders-fabricsupdate', 'update', NULL, 'published', NULL, '2020-04-29 22:10:06', '2020-04-29 22:10:06'),
('d2bb7932-8cfa-4af1-a8b4-8a8c128899c6', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-aviaments.index', 'adminorders-aviamentsindex', 'index', NULL, 'published', NULL, '2020-04-29 22:10:20', '2020-04-29 22:10:20'),
('4fa63559-16b0-4e21-b0aa-939590c799ed', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-aviaments.create', 'adminorders-aviamentscreate', 'create', NULL, 'published', NULL, '2020-04-29 22:10:34', '2020-04-29 22:10:34'),
('5d002152-c9ed-4bbc-97a0-37aebfb033a7', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-aviaments.show', 'adminorders-aviamentsshow', 'show', NULL, 'published', NULL, '2020-04-29 22:13:09', '2020-04-29 22:13:09'),
('ae9d12ff-231f-4c3c-b9b2-fe48711663c7', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-aviaments.edit', 'adminorders-aviamentsedit', 'edit', NULL, 'published', NULL, '2020-04-29 22:13:25', '2020-04-29 22:13:25'),
('82accf84-cc82-415f-af0f-374258d17fa3', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'admin.orders-aviaments.update', 'adminorders-aviamentsupdate', 'update', NULL, 'published', NULL, '2020-04-29 22:13:45', '2020-04-29 22:13:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
('46eb08bd-aab7-4741-912e-69f95ce0bb6e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:36:34', '2020-04-29 21:36:34'),
('1287fc7c-ca5b-432d-82c4-8b9228cc0d76', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:36:34', '2020-04-29 21:36:34'),
('ad63afd7-e77d-4539-ae5b-06888229aabf', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('f6675c74-7c0f-47ae-ad73-c5f9bbffa315', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('ecc7b6a9-e24e-45c0-bcce-35e97e661bd5', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('2ae605c2-0768-43d9-9878-c8b73d2c6b2a', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('a68e6b8e-11e6-4456-bfae-055bfb4c8fdb', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('97dc55d4-7cab-42fd-b610-5cb9cb78972e', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('499f140b-e179-4c73-8720-cf5a33a1c296', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('4812ff75-1c69-4b9b-9d63-33579c419694', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:19:00', '2020-03-18 16:19:00'),
('7651e190-904a-4ba2-8536-1ee89c2f4e95', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 16:15:56', '2020-03-18 16:15:56'),
('3bd6fedd-4cc8-407f-8d91-dcd749bcbd8f', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 15:49:08', '2020-03-18 15:49:08'),
('d1696855-b0e6-4b58-8431-2c964daa1f4e', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 15:49:08', '2020-03-18 15:49:08'),
('ce59e900-328e-4d4c-8e7f-23d5e418bb83', '624ebcd8-cd77-4452-9897-359216197217', '2020-03-18 15:49:08', '2020-03-18 15:49:08'),
('8d5f1b9d-a7b4-4394-aa77-31d1d30fbdc0', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('1c11225b-5673-4af0-b11f-31f9cd2695e7', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('9289f38b-43f6-49fb-8029-b337db6a0b53', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('3d9ed8e7-7bcf-4718-bcad-c0c5b1cada23', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a0109472-a847-4458-a9f8-6d8ba1c001a2', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ee0c2bf9-72c7-4c18-bb71-fa06e9c0bca4', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('17cf8189-5e71-410c-acd3-ca065233564b', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('6155ceab-fee2-4f92-8b19-5af77640a5f5', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('99cc8651-8d49-4a35-8f76-fab02cdb9706', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('3293bc53-b035-402a-a0c4-90e5f9bd797a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('deea13dd-837c-4bfc-958f-c323e726aabb', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('b1f03b5d-fd11-41de-abff-23b3995d4c91', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('61299cfb-6218-4c37-9fcf-6308bea16307', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('d31f0c5b-74fa-4212-9125-67fb3579c498', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('41d6d43e-122b-4c83-af2e-d608caae6ed2', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('35ce3dd1-5de3-4d33-891a-1533af6d431a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('6193cee4-aee3-4b19-8fe8-32559d8093dc', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('c12dd0b8-1546-4305-b862-6fcbb8728590', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a01b989d-4036-465d-8dfe-35d0e9e7945a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('41c117f9-0a4e-4d11-b95a-b5addcdfc09a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ffa32fb6-58c3-4c91-aa10-9e973ac372e5', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('68af8771-3d19-43d6-bc13-b5fa5692c198', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('99049c67-26d8-430f-b2a9-69cccf6f293a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('1842ad21-2712-403a-9b9f-1f42829c56f9', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('e87691ab-438d-482e-9313-446f63a7269d', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('1c4e9725-62f7-499b-a17b-1943e800cdb1', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('d1dbffef-ed81-4a9e-ae5c-ee0160d82d5d', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a3ad8d0d-924f-4012-a44c-300bf7d3f317', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('71ad5626-95f3-4911-b8d4-c8a35413c52d', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('786a5ee6-0afa-442f-90e1-e1c9ca046d07', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('db9076b0-d250-4c10-948d-e42ab4951c59', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('4497a060-51ea-477e-9028-8f04e56f91d1', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('f7871b6d-0e28-411d-807a-a9561916ad25', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ccc238d1-9f9c-41bb-8d8b-9b409dfece34', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('cd8e1b16-ffec-446a-a36b-d7e688e6a21b', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a1ba7572-64ff-4c95-8d0d-71815dee3e41', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('c517e179-8bd5-4cca-8e54-07fe63c38227', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('c4df938b-7c6a-40b8-b0f5-ab2dd6b68e70', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('6f8d816f-0251-4a73-9db7-acb3a8ac0305', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('e9b00fb3-e6f5-4315-8e46-f69e63fba80e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('4d62ed2a-c08a-4ecd-bdb0-6b9282346214', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('50669dcf-06e2-419b-9869-56e0051e55ba', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a17c9419-7ea5-4a1f-83eb-d46b5494877b', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('37fadf84-ecca-4994-9424-3a3a6dcffdb1', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('4bdbcde4-2a07-492f-8cad-eb5887e6f233', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('50f8d609-00e6-45e2-b683-e5c4eeed9f32', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('09169b31-e0cb-4e5e-84cd-7777c6586ed7', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('15db1f6c-ac62-4a40-87e5-1e61d8e3bba6', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('3d47c008-92fe-4732-bff7-8d3fe0e81c28', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('25b2c009-6c94-4774-a0dd-64afcd6bd3d7', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('1653618f-f1b6-417e-8f5a-854b9c565a8a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('fba85570-3865-425e-8164-578ff8ca5ef1', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a7b73709-9270-4027-a665-e95170e3dff8', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a916bb38-10d4-4f27-a3a2-bd4e3bbc3500', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('fce4c836-4bc2-4a66-9209-a49d86ab980f', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('44e73a15-c072-4781-b680-07e1ee3500d3', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('290e3394-6c40-446b-9431-70af3836e167', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('1e1779ae-5586-44a7-8518-7ae8d4e5c2be', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('3d6e9f27-518e-401d-9ea7-ba73d3be4b06', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('7db5a33e-d3da-41ad-9313-d9d2a1f8c405', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('d30a1044-6f1b-4953-9e25-d95fbcac4b21', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('70faff17-71cf-425f-9bac-a29dfe880c79', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('28b9de03-fedf-49ec-bf1d-43b30ef67827', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('3b4ab6c5-10e7-41f0-aad7-0187dccd7fea', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('8a5dd08f-9eb5-4b79-a8fa-62e7ca81520a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('933f0cea-d9de-4443-8587-23dd11946781', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('75b1b9ca-4f6e-4c15-aae3-41e76cb4445e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ffcd94ce-0a4f-40b7-a6e1-7289bf80759a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('b8f99d40-f6f9-472a-8cb3-0f179862a753', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ee134be8-d15a-4878-981f-017b35a8c7a8', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('0e5d18ab-1913-4fa8-b5b8-53e7dc844bae', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('20c5e849-c31f-49b3-ae5a-fa3119bba4f0', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('db93014c-9e3d-4b79-bcf6-4fe3687fa3b3', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('27dc7613-41dd-4c38-848d-a735c46602bc', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('74357f5f-247e-477f-860e-8f2c83a8b5e0', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('43e22e94-7b1e-4d52-9860-ce443c26d532', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('697df663-dafa-4767-a9c4-655ace8e6cae', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('37220eed-c15e-4c9c-9e82-ce975acb47e6', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('fca5bb8e-8f70-4e2e-a00e-2c76fe314d34', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('9e7cadef-5a97-4d3e-89fd-a7944211a86a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('79dd8801-7c1a-42df-8346-4a16d6b394d1', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('7651e190-904a-4ba2-8536-1ee89c2f4e95', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('c10035c4-3b9a-450c-b272-8f0f5bf8846d', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('3bd6fedd-4cc8-407f-8d91-dcd749bcbd8f', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('00734d2f-97b0-48c3-b8a9-48da3efaa568', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('222de983-9ab0-44a9-9ed7-0c59c47a2718', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('3aa30403-955c-4a76-9957-a6acf4f087e5', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('d1696855-b0e6-4b58-8431-2c964daa1f4e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ce59e900-328e-4d4c-8e7f-23d5e418bb83', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('4812ff75-1c69-4b9b-9d63-33579c419694', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('499f140b-e179-4c73-8720-cf5a33a1c296', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('97dc55d4-7cab-42fd-b610-5cb9cb78972e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a68e6b8e-11e6-4456-bfae-055bfb4c8fdb', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('2ae605c2-0768-43d9-9878-c8b73d2c6b2a', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ecc7b6a9-e24e-45c0-bcce-35e97e661bd5', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('f6675c74-7c0f-47ae-ad73-c5f9bbffa315', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('ad63afd7-e77d-4539-ae5b-06888229aabf', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-03-18 15:52:49', '2020-03-18 15:52:49'),
('a938cbac-6db7-4f52-8210-b3f626c13f67', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:36:34', '2020-04-29 21:36:34'),
('a62ef9a9-ce95-4135-b224-d012174305c5', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('4e1b6ee2-567e-46b8-af41-b2247bf9a3d5', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('90972878-a619-4574-aca0-002adce244cd', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('88449e61-c137-4af9-a71b-41b03574d707', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('f5b363dc-1d17-4c19-8b07-65eedb2246ec', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('c8598414-5a64-4a70-9470-04e3045fe660', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('fa5e11e5-4eb7-4d6a-92e0-3365a7456aa7', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('b1bef097-de5a-4433-9c5e-23daaedb8240', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('691eb369-d3be-4268-b407-cb90d2679a97', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('6b78fda5-7d5a-4d11-99c6-ff3e416af07e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('526bb351-fbd3-454c-b41c-0e1edb36db11', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('644f0671-212f-4493-8e7b-803d365e1b5e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:08', '2020-04-29 21:45:08'),
('ec607834-b904-403f-b1a2-82bd96db10e3', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 21:45:16', '2020-04-29 21:45:16'),
('32315f40-65f2-4307-8dab-94ef046cc1c3', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('6ccfbf09-eecf-4b3c-b1df-c7006a404b8e', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('515a1a6a-5302-4dc4-a2c6-280e2003195f', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('af582e73-2524-4711-b7fb-300ee39d1690', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('d2bb7932-8cfa-4af1-a8b4-8a8c128899c6', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('4fa63559-16b0-4e21-b0aa-939590c799ed', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('5d002152-c9ed-4bbc-97a0-37aebfb033a7', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('ae9d12ff-231f-4c3c-b9b2-fe48711663c7', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12'),
('82accf84-cc82-415f-af0f-374258d17fa3', '95d1acf9-a422-4c52-b667-41eb64792a45', '2020-04-29 22:14:12', '2020-04-29 22:14:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

CREATE TABLE `products` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stoke` int(11) DEFAULT NULL,
  `information` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `products`
--

INSERT INTO `products` (`id`, `company_id`, `user_id`, `name`, `reference`, `slug`, `stoke`, `information`, `details`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('8714dcd6-3c52-479a-b201-84e6327114a0', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Calça modelo 01', '01', 'calca-modelo-01', NULL, 'modelo 01 de calça', 'detalhes da calça e modelo aqui', 'descrição da calça e modelo aqui', 'published', '2020-02-15 05:44:30', '2020-03-18 19:57:44', '2020-03-18 19:57:44'),
('cf5963f5-1de1-485b-ae9f-137a32423a24', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Botao', '21350', 'botao', 20, NULL, NULL, NULL, 'published', '2020-04-22 20:43:09', '2020-04-22 20:53:41', '2020-04-22 20:53:41'),
('3eeb4cfd-ca4b-44c9-a1fd-33963033e38c', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'rebite', NULL, 'rebite', 20, NULL, NULL, NULL, 'published', '2020-04-22 20:45:55', '2020-04-22 20:53:47', '2020-04-22 20:53:47'),
('2d4e6c10-c5cb-4c15-af69-e19db1c2fef6', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'ziper', '3456', 'ziper', 20, NULL, NULL, NULL, 'published', '2020-04-22 20:46:44', '2020-04-22 20:53:52', '2020-04-22 20:53:52'),
('0ebcd80b-e5f2-4d4f-b0ee-18fb22ad2f4c', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Calça Jeans', '12301', 'calca-jeans', NULL, NULL, NULL, NULL, 'published', '2020-04-22 20:58:03', '2020-04-22 20:58:03', NULL),
('54c22175-4095-4ab2-a832-099b9cd38826', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'short', '15406', 'short', NULL, NULL, NULL, NULL, 'published', '2020-04-22 20:58:42', '2020-04-22 20:58:42', NULL),
('3d2a6e89-64ba-4907-969b-68f41f2476d1', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Calça Flair', '34567', 'calca-flair', NULL, NULL, NULL, NULL, 'published', '2020-04-22 21:01:55', '2020-04-22 21:01:55', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `providers`
--

CREATE TABLE `providers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fantasy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `providers`
--

INSERT INTO `providers` (`id`, `company_id`, `user_id`, `name`, `fantasy`, `slug`, `email`, `phone`, `document`, `ie`, `description`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('d3536b80-0935-40cb-9e50-7b9fb950511c', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Corte do Zé', 'Corte do Zé', 'corte-do-ze', 'ze@cortedoze.com.br', '4999181392', '451.414.210-74', '222222222222222', 'descrião do endereço', 'published', NULL, '2020-02-15 05:43:41', '2020-03-18 19:57:51', '2020-03-18 19:57:51'),
('79f29f74-bf7c-409c-bedc-a250a57c1811', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Faccão André', 'Faccao André', 'faccao-andre', 'andre@hotmail.com', NULL, '00000000', NULL, NULL, 'published', NULL, '2020-04-22 20:34:29', '2020-04-22 20:34:29', NULL),
('1f935a98-d17b-4408-ae65-6c600b49952a', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Lavanderia Lavato', 'lavato', 'lavanderia-lavato', 'lavato@hotmail.com', NULL, '676755656', NULL, NULL, 'published', NULL, '2020-04-22 20:36:50', '2020-04-22 20:36:50', NULL),
('25051910-ff28-402b-9b68-ef5774bed0c7', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Diferenciado Jakson', 'Diferenciado', 'diferenciado-jakson', 'dif@hotmail.com', NULL, '34345667676', NULL, NULL, 'published', NULL, '2020-04-22 20:38:07', '2020-04-22 20:38:07', NULL),
('801b3395-016d-495d-ac99-2360c8c234a4', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Travete', 'Travete', 'travete', 'travete@hotmail.com', NULL, '5567676', NULL, NULL, 'published', NULL, '2020-04-22 20:39:17', '2020-04-22 20:39:17', NULL),
('d6b6a387-bd6f-47b3-b0d1-8b5736b7e650', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'lavanderia Handle', 'handle', 'lavanderia-handle', 'handle@hotmail.com', NULL, '3434343', NULL, NULL, 'published', NULL, '2020-04-22 20:39:59', '2020-04-22 20:39:59', NULL),
('b39d58ee-6934-4740-a383-50166edde21c', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Faccao Renata', 'renata', 'faccao-renata', 'renata@hotmail.com', NULL, '54567890', NULL, NULL, 'published', NULL, '2020-04-22 20:40:34', '2020-04-22 20:40:34', NULL),
('73eac5f1-381a-490e-a962-b8db9a55cdf0', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Corte Everton', 'everton', 'corte-everton', 'everton@hotmail.com', NULL, '34456789', NULL, NULL, 'published', NULL, '2020-04-22 21:14:37', '2020-04-22 21:14:37', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `company_id`, `user_id`, `name`, `slug`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`, `special`) VALUES
('d33da5c2-35f1-4f88-add0-3063e747f896', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Super Admin', 'super-admin', NULL, 'published', NULL, '2020-02-15 04:35:37', '2020-02-15 04:35:37', 'all-access'),
('95d1acf9-a422-4c52-b667-41eb64792a45', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Gerente', 'gerente', 'Consegue fazer todas as operações no sistema', 'published', NULL, '2020-02-15 04:35:37', '2020-02-15 04:35:37', NULL),
('2216c5bd-1507-4ef6-83e3-bea3b175ea81', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Cliente ', 'cliente ', 'Consegue fazer pedidos, acompanhar pedidos ', 'published', NULL, '2020-02-15 04:35:38', '2020-02-15 04:35:38', NULL),
('624ebcd8-cd77-4452-9897-359216197217', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Funcionários', 'funcionarios', 'Consegue visualizar eventos', 'published', NULL, '2020-02-15 04:35:38', '2020-03-07 03:46:16', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_user`
--

CREATE TABLE `role_user` (
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
('d33da5c2-35f1-4f88-add0-3063e747f896', '1021ff71-bb91-4b20-a965-6c95378250b8', '2020-02-15 04:35:40', '2020-02-15 04:35:40'),
('624ebcd8-cd77-4452-9897-359216197217', '299e0511-8304-42af-90e2-6046cb79c99d', '2020-02-15 05:42:53', '2020-02-15 05:42:53'),
('95d1acf9-a422-4c52-b667-41eb64792a45', '14fde4a3-6f2d-457f-a01f-fe2e80b5c71e', '2020-03-05 17:25:16', '2020-03-05 17:25:16'),
('2216c5bd-1507-4ef6-83e3-bea3b175ea81', '14fde4a3-6f2d-457f-a01f-fe2e80b5c71e', '2020-03-05 17:25:16', '2020-03-05 17:25:16'),
('624ebcd8-cd77-4452-9897-359216197217', '14fde4a3-6f2d-457f-a01f-fe2e80b5c71e', '2020-03-05 17:25:16', '2020-03-05 17:25:16'),
('95d1acf9-a422-4c52-b667-41eb64792a45', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', '2020-03-18 15:50:51', '2020-03-18 15:50:51'),
('624ebcd8-cd77-4452-9897-359216197217', 'c68a87be-0ece-4be3-a6c9-e48e99689514', '2020-04-22 21:40:13', '2020-04-22 21:40:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `stages`
--

CREATE TABLE `stages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `alert_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `stages`
--

INSERT INTO `stages` (`id`, `company_id`, `user_id`, `name`, `slug`, `ordering`, `alert_time`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('66841b73-dcf0-4d5a-a7f6-a800aaf19ba2', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Facção', 'faccao', 2, '20', NULL, 'published', '2020-03-07 03:44:03', '2020-03-07 03:44:03', NULL),
('47d9de6e-9db5-4c14-876d-8168724b0828', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Corte', 'corte', 1, '20', NULL, 'published', '2020-03-07 03:43:36', '2020-03-07 03:43:36', NULL),
('ef246c3d-5284-4e72-aa07-8d6bdea2a056', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Travet', 'travet', 3, '20', NULL, 'published', '2020-03-07 03:44:24', '2020-03-07 03:44:24', NULL),
('9a83a88b-4828-43b5-9477-6ec51044871b', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Diferenciado', 'diferenciado', 4, '20', NULL, 'published', '2020-03-07 03:44:41', '2020-03-07 03:44:41', NULL),
('6cab47c1-da0d-406c-a0df-8576e423c4a3', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Lavanderia', 'lavanderia', 5, '20', NULL, 'published', '2020-03-07 03:45:00', '2020-03-07 03:45:00', NULL),
('f2f9a3b2-dd19-4649-9c97-aeba02db3db1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Aprontamento', 'aprontamento', 6, '20', NULL, 'published', '2020-03-07 03:45:41', '2020-05-30 01:18:31', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `stocks`
--

CREATE TABLE `stocks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assets` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fabrics',
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metreage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `stocks`
--

INSERT INTO `stocks` (`id`, `company_id`, `user_id`, `name`, `slug`, `assets`, `reference`, `metreage`, `amount`, `width`, `price`, `minimum_quantity`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1fadcd2d-06cb-4208-8b5b-133f41506885', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Ziper amarelo', 'ziper-amarelo', 'aviaments', '02', NULL, '1000', NULL, '1.00', '5', 'teste de descriçaõ ziper', 'published', '2020-03-10 21:52:37', '2020-03-18 19:57:33', '2020-03-18 19:57:33'),
('53c94fb9-fde3-40e5-83fd-9a786aab8e6f', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Tecido Djeans', 'tecido-djeans', 'fabrics', '02', '50', '40', '3', '49.90', '5', 'Tecido Djeans', 'published', '2020-03-10 21:51:13', '2020-03-18 19:57:07', '2020-03-18 19:57:07'),
('42346f62-80de-45c3-9807-4c53a2cb4fd1', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Rolo de 20 metros azul', 'rolo-de-20-metros-azul', 'fabrics', '01', '20', '10', '2', '10.50', '5', NULL, 'published', '2020-03-07 03:55:00', '2020-03-18 19:57:03', '2020-03-18 19:57:03'),
('45fe459b-8586-44c3-9450-d88871f8f876', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8', 'Botão Bronze', 'botao-bronze', 'aviaments', '01', NULL, '500', NULL, '0.50', '100', NULL, 'published', '2020-03-07 03:53:58', '2020-03-18 19:57:30', '2020-03-18 19:57:30'),
('4c0c3675-3575-43c2-9b0c-bd92a9f6d530', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Padua', 'padua', 'fabrics', NULL, '100', '10', '1,6', '10.50', NULL, NULL, 'published', '2020-04-22 21:07:25', '2020-04-22 21:07:25', NULL),
('bf12fccf-57e4-4872-bfd9-4eb100e243a6', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Brescia', 'brescia', 'fabrics', NULL, '90', '1', '1,6', '10.60', NULL, NULL, 'published', '2020-04-22 21:08:54', '2020-04-22 21:08:54', NULL),
('34cecaed-a519-428e-be45-a9a499213e15', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'rebite', 'rebite', 'aviaments', '34567', NULL, '500', NULL, '0.03', '200', NULL, 'published', '2020-04-22 21:10:34', '2020-04-22 21:10:34', NULL),
('fd5ae87c-1425-475c-a638-088254f79e64', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'botão', 'botao', 'aviaments', '15406', NULL, '500', '23', '0.25', '200', NULL, 'published', '2020-04-22 21:12:07', '2020-04-22 21:12:07', NULL),
('07614add-b070-4f97-beca-5257723bf7db', 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6', 'ziper 12 - 333', 'ziper-12-333', 'aviaments', '3456', NULL, '500', '12', '0.43', '200', 'zíper azul', 'published', '2020-04-22 21:13:09', '2020-04-22 21:13:09', NULL),
('57530d05-2ab2-404c-a233-b79c6493721e', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Fano', 'fano', 'fabrics', NULL, '100', '3', '1,6', '10.00', NULL, NULL, 'published', '2020-05-29 21:50:51', '2020-05-29 22:29:29', NULL),
('1a1e0404-07ce-4206-9e8e-97e1e7f0f9b5', 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL, 'Fano', 'fano', 'fabrics', NULL, '96', '1', '1,6', '', NULL, NULL, 'published', '2020-05-29 21:51:37', '2020-05-29 21:51:37', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `stored_routes`
--

CREATE TABLE `stored_routes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pattern` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middleware` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'auth',
  `resource` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fantasy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT 'male',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('deleted','draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `fantasy`, `email`, `phone`, `document`, `birthday`, `gender`, `password`, `is_admin`, `description`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `company_id`, `user_id`) VALUES
('1021ff71-bb91-4b20-a965-6c95378250b8', 'Super Admin', 'super-admin', NULL, 'supera-admin@sistema.maxpremiumjeans.com.br', '(74) 2092-5950', '6067342177333765', NULL, 'male', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Et voluptatem assumenda quia illo iure nesciunt ea.', 'published', 'oeFgZu4BDDyIwob1bP0oT1JyejqzH0NADlSUtQO72XudyPSOiikE3sq3rbs3', '2020-02-15 04:35:38', '2020-02-15 04:35:38', NULL, 'b77a0401-a321-487d-979a-5db49f6d14dc', NULL),
('299e0511-8304-42af-90e2-6046cb79c99d', 'Dionatan Martins', 'dionatan-martins', NULL, 'dionatanwork@hotmail.com', '49991813927', '01851892028', NULL, 'male', '$2y$10$/rtoh69rGQxLwx1N8YHF1.dNKVAm68PpubPamqKhVpLDJ4HynypKe', 1, NULL, 'published', NULL, '2020-02-15 05:42:44', '2020-03-18 15:35:55', NULL, 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8'),
('14fde4a3-6f2d-457f-a01f-fe2e80b5c71e', 'CLAUDIO COELHO DE CAMPOS', 'claudio-coelho-de-campos', NULL, 'callcocam@gmail.com', '4835351603', '19057591855', NULL, 'male', '$2y$10$Lk2lUg31WhnqVpzCAuvu6exr2U/zE0GrQ6F4cKiwyrKDRGuuLZsyu', 1, NULL, 'published', NULL, '2020-03-05 17:25:06', '2020-04-22 20:29:08', '2020-04-22 20:29:08', 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8'),
('d2f79385-ffcc-4dcb-a85f-52df10338bd6', 'Maksander Monteiro', 'maksander-monteiro', NULL, 'maksmonteiro@hotmail.com', NULL, '841.658.200-91', NULL, 'male', '$2y$10$2ZsqquwkRSHf80mpzVbcLees/xNGtDXMjnNM46fCGVMBHoTdAjwze', 1, NULL, 'published', NULL, '2020-03-18 15:50:36', '2020-03-18 15:50:36', NULL, 'b77a0401-a321-487d-979a-5db49f6d14dc', '1021ff71-bb91-4b20-a965-6c95378250b8'),
('c68a87be-0ece-4be3-a6c9-e48e99689514', 'Edivaldo', 'edivaldo', NULL, 'edivaldosillvaa1980@gmail.com', NULL, '34356789009', NULL, 'male', '$2y$10$i6MWawaB1/xqqewAlS0OjONLPfw4fkPgdeNrQ.XTbpOb1fkAxn/HG', 1, NULL, 'published', NULL, '2020-04-22 21:39:59', '2020-04-22 22:46:05', NULL, 'b77a0401-a321-487d-979a-5db49f6d14dc', 'd2f79385-ffcc-4dcb-a85f-52df10338bd6');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_company_id_foreign` (`company_id`),
  ADD KEY `activity_log_user_id_foreign` (`user_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Índices de tabela `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_company_id_foreign` (`company_id`),
  ADD KEY `address_user_id_foreign` (`user_id`),
  ADD KEY `address_addresable_type_addresable_id_index` (`addresable_type`,`addresable_id`);

--
-- Índices de tabela `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`),
  ADD UNIQUE KEY `companies_assets_unique` (`assets`),
  ADD KEY `companies_company_id_foreign` (`company_id`),
  ADD KEY `companies_user_id_foreign` (`user_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_company_id_foreign` (`company_id`),
  ADD KEY `files_user_id_foreign` (`user_id`),
  ADD KEY `files_fileable_type_fileable_id_index` (`fileable_type`,`fileable_id`);

--
-- Índices de tabela `grids`
--
ALTER TABLE `grids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grids_company_id_foreign` (`company_id`),
  ADD KEY `grids_user_id_foreign` (`user_id`);

--
-- Índices de tabela `grid_number`
--
ALTER TABLE `grid_number`
  ADD KEY `grid_number_grid_id_index` (`grid_id`),
  ADD KEY `grid_number_number_id_index` (`number_id`);

--
-- Índices de tabela `grid_order_items`
--
ALTER TABLE `grid_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grid_order_items_company_id_foreign` (`company_id`),
  ADD KEY `grid_order_items_user_id_foreign` (`user_id`),
  ADD KEY `grid_order_items_order_id_foreign` (`order_id`),
  ADD KEY `grid_order_items_grid_id_foreign` (`grid_id`),
  ADD KEY `grid_order_items_number_id_foreign` (`number_id`);

--
-- Índices de tabela `input_process_steps`
--
ALTER TABLE `input_process_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `input_process_steps_company_id_foreign` (`company_id`),
  ADD KEY `input_process_steps_user_id_foreign` (`user_id`),
  ADD KEY `input_process_steps_stage_id_foreign` (`stage_id`),
  ADD KEY `input_process_steps_provider_id_foreign` (`provider_id`),
  ADD KEY `input_process_steps_order_id_foreign` (`order_id`);

--
-- Índices de tabela `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_company_id_foreign` (`company_id`),
  ADD KEY `items_user_id_foreign` (`user_id`),
  ADD KEY `items_order_id_foreign` (`order_id`),
  ADD KEY `items_fabric_id_foreign` (`fabric_id`),
  ADD KEY `items_aviament_id_foreign` (`aviament_id`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `numbers`
--
ALTER TABLE `numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numbers_company_id_foreign` (`company_id`),
  ADD KEY `numbers_user_id_foreign` (`user_id`);

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_codigo_unique` (`codigo`),
  ADD KEY `orders_company_id_foreign` (`company_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_responsible_id_foreign` (`responsible_id`),
  ADD KEY `orders_grid_id_foreign` (`grid_id`),
  ADD KEY `orders_fabric_id_foreign` (`fabric_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices de tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_company_id_foreign` (`company_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_input_process_step_id_foreign` (`input_process_step_id`),
  ADD KEY `payments_provider_id_foreign` (`provider_id`);

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD KEY `permissions_company_id_foreign` (`company_id`),
  ADD KEY `permissions_user_id_foreign` (`user_id`);

--
-- Índices de tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Índices de tabela `permission_user`
--
ALTER TABLE `permission_user`
  ADD KEY `permission_user_permission_id_index` (`permission_id`),
  ADD KEY `permission_user_user_id_index` (`user_id`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_company_id_foreign` (`company_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Índices de tabela `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `providers_email_unique` (`email`),
  ADD KEY `providers_company_id_foreign` (`company_id`),
  ADD KEY `providers_user_id_foreign` (`user_id`);

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_company_id_foreign` (`company_id`),
  ADD KEY `roles_user_id_foreign` (`user_id`);

--
-- Índices de tabela `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Índices de tabela `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stages_company_id_foreign` (`company_id`),
  ADD KEY `stages_user_id_foreign` (`user_id`);

--
-- Índices de tabela `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_company_id_foreign` (`company_id`),
  ADD KEY `stocks_user_id_foreign` (`user_id`);

--
-- Índices de tabela `stored_routes`
--
ALTER TABLE `stored_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stored_routes_company_id_foreign` (`company_id`),
  ADD KEY `stored_routes_user_id_foreign` (`user_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_company_id_foreign` (`company_id`),
  ADD KEY `users_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
