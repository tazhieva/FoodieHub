//
//  Product.swift
//  FoodieHub
//
//  Created by Акмарал Тажиева on 18.05.2023.
//

import Foundation

struct Product: Codable {
    let name: String
    let price: Int
    let image: String
    let category: String
    var quantity: Int?
    var available: Bool
}

struct MockData {
    
    static let products: [Product] = [
        Product(name: "Авокадо Хасс Колумбия шт",
                price: 1190,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/237984-avokado_hass_kolumbiya_sht_.jpg?w=360&h=360&_c=1684403230",
                category: "Фрукты",
                available: false),
        Product(name: "Бананы кг",
                price: 990,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/19445-banany_kg.jpg?w=360&h=360&_c=1684476754",
                category: "Фрукты",
                available: true),
        Product(name: "Яблоко Гренни Смит Франция кг",
                price: 1260,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/242599-yabloko_grenni_smit_franciya_kg.jpg?w=360&h=360&_c=1683541312",
                category: "Фрукты",
                available: true),
        Product(name: "Дыня Галия кг",
                price: 7235,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/288823-dynya_galiya_kg.jpg?w=360&h=360&_c=1684404384",
                category: "Фрукты",
                available: false),
        Product(name: "Голубика Марокко 125 г",
                price: 1755,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/291835-golubika_marokko_125_g.jpg?w=360&h=360&_c=1684410249",
                category: "Ягоды",
                available: true),
        Product(name: "Клубника Сольхянг S от Arbuz.kz 400 г",
                price: 2340,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/286074-klubnika_solhyang_s_ot_arbuz_kz_500_g.jpg?w=360&h=360&_c=1684410250",
                category: "Ягоды",
                available: true),
        Product(name: "Киви золотое кг",
                price: 7680,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/288829-kivi_zolotoe_kg.jpg?w=360&h=360&_c=1684404523",
                category: "Фрукты",
                available: true),
        Product(name: "Питахайя желтая кг",
                price: 19540,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/274562-pitahaiya_ayakaz_zheltaya_vnutri_kg.jpg?w=360&h=360&_c=1684403233",
                category: "Фрукты",
                available: false),
        Product(name: "Мангустин кг",
                price: 14365 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/270171-mangustin_kg.jpg?w=360&h=360&_c=1684403234",
                category: "Фрукты",
                available: true),
        Product(name: "Питахайя шт",
                price: 1820 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/186620-39-pitahaiya_drakon_fru_ru.jpg?w=360&h=360&_c=1684403237",
                category: "Фрукты",
                available: false),
        Product(name: "Персик лохматый кг",
                price: 3120,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/256079-persik_lohmatyi_kg_tashkent.jpg?w=360&h=360&_c=1684475904",
                category: "Фрукты",
                available: true),
        Product(name: "Томаты бриоза Tomatik Аксия красные кг",
                price: 2955,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/290147-tomaty_brioza_tomatik_aksiya_krasnye_kg.jpg?w=360&h=360&_c=1684209509",
                category: "Овощи",
                available: true),
        Product(name: "Лук порей",
                price: 2160,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/19365-luk_porei.jpg?w=360&h=360&_c=1683544385",
                category: "Овощи",
                available: true),
        Product(name: "Пастернак кг",
                price: 6200,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/274428-pasternak_ayakaz_kg.jpg?w=360&h=360&_c=1684469464",
                category: "Овощи",
                available: true),
        Product(name: "Редис дайкон",
                price: 715,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/19351-redis_daikon.png?w=360&h=360&_c=1684467497",
                category: "Овощи",
                available: true),
        Product(name: "Перец полугорький красный кг",
                price: 1925,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/19379-perec_polugorkii_krasnyi.jpg?w=360&h=360&_c=1684396182",
                category: "Овощи",
                available: true),
        Product(name: "Грибы Вешенки",
                price: 2535,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/189782-griby_veshenki.jpg?w=360&h=360&_c=1684464792",
                category: "Овощи",
                available: true),
        Product(name: "Кабачки кг",
                price: 695,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/19395-kabachki.jpg?w=360&h=360&_c=1684476228",
                category: "Овощи",
                available: true),
        Product(name: "Перец светофор зелёный кг",
                price: 1365 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/250705-perec_bolgarskii_zel_nyi_kg.jpg?w=360&h=360&_c=1684230728",
                category: "Овощи",
                available: true),
        Product(name: "Перец светофор жёлтый кг",
                price: 1365,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/250703-perec_bolgarskii_zheltyi_kg.jpg?w=360&h=360&_c=1684230728",
                category: "Овощи",
                available: true),
        
        Product(name: "Сметана Простоквашино 15% 300 г",
                price: 965,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/273306-smetana_prostokvashino_15_300_g.jpg?w=360&h=360&_c=1684381862" ,
                category: "Молочные продукты" ,
                available: true),
        Product(name: "Напиток Alpro миндальный без сахара 1 л",
                price: 2555,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/259288-napitok_alpro_mindalnyi_bez_sahara_1_l.jpg?w=360&h=360&_c=1683188977",
                category: "Молочные продукты",
                available: true),
        Product(name: "Масло Простоквашино сливочное 82% 180 г",
                price: 1830 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/188402-maslo_prostokvashino_slivochnoe_82_180_g.jpg?w=360&h=360&_c=1684408201",
                category: "Молочные продукты",
                available: true),
        Product(name: "Молоко Шадринское пастеризованное 6% 950 мл",
                price: 1480,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/231384-moloko_shadrinskoe_pasterizovannoe_6_950_ml.jpg?w=360&h=360&_c=1683274866",
                category: "Молочные продукты",
                available: true),
        Product(name: "Молоко Амиран живое 3,2% 0,8 л",
                price: 730,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/191336-moloko_amiran_zhivoe_3_2_0_8_l.jpeg?w=360&h=360&_c=1683767816",
                category: "Молочные продукты",
                available: true),
        Product(name: "Сметана Амиран 20% 380 г",
                price: 950,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/79309-smetana_amiran_20_380_g.jpg?w=360&h=360&_c=1684381862",
                category: "Молочные продукты",
                available: true),
        Product(name: "Творог Простоквашино рассыпчатый 2% 290 г",
                price: 1345,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/273298-tvorog_prostokvashino_rassypchatyi_2_290_g.png?w=360&h=360&_c=1684232195",
                category: "Молочные продукты",
                available: true),
        Product(name: "Биойогурт Активиа питьевой питательные злаки 670 г",
                price: 830,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/225770-bioiogurt_aktivia_pitevoi_pitatelnye_zlaki_670_g.jpg?w=360&h=360&_c=1684232175",
                category: "Молочные продукты",
                available: true),
        Product(name: "Йогурт Teos греческий 2% 250 гр",
                price: 690,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/279941-iogurt_teos_grecheskii_2_250_gr.jpg?w=360&h=360&_c=1684315129",
                category: "Молочные продукты",
                available: true),
        Product(name: "Сыр Сваля Parnidzio 38% кг",
                price: 11710 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/283231-syr_svalya_parnidzio_38_kg.jpg?w=360&h=360&_c=1683270311",
                category: "Молочные продукты",
                available: true),
        Product(name: "Сыр Natura сливочный 45% 300 г",
                price: 2795,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/277431-syr_arla_natura_slivochnyi_45_300_g.jpg?w=360&h=360&_c=1684318333",
                category: "Молочные продукты",
                available: true),
        Product(name: "Сыр Ламбер сливочный 55% кг",
                price: 7555 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/56056-syr_lamber_slivochnyi_55_kg.png?w=360&h=360&_c=1683270366",
                category: "Молочные продукты",
                available: true),
        Product(name: "Сыр Белорусские сыры Сметанковый 50% кг Беларусь",
                price: 4505,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/238875-syr_belorusskie_syry_smetankovyi_50_kg_belarus.png?w=360&h=360&_c=1684309480",
                category: "Молочные продукты",
                available: true),
        Product(name: "Сыр El Pastor из овечьего молока Курадо с розмарином 12 месяцев выдержки 175 г",
                price: 3675,
                image:"https://arbuz.kz/image/s3/arbuz-kz-products/264966-syr_el_pastor_iz_ovechego_moloka_kurado_s_rozmarinom_12_mesyacev_vyderzhki_150_g.png?w=360&h=360&_c=1684396011",
                category: "Молочные продукты",
                available: true),
        Product(name: "Сыр Умалат кавказский 370 гр",
                price: 1965,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/280848-syr_umalat_kavkazskii_370_gr.webp?w=360&h=360&_c=1683270321",
                category: "Молочные продукты",
                available: true),
        Product(name: "Чай Tess Banana Split черный 20 пирамидок",
                price: 812,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/165652-chai_chernyi_tess_banana_split_20_piramidok.jpg?w=360&h=360&_c=1683714586",
                category: "Напитки",
                available: true),
        Product(name: "Чай черный Greenfield Golden Ceylon 100 пакетиков",
                price: 3056 ,
                image:"https://arbuz.kz/image/s3/arbuz-kz-products/20690-chai_chernyi_quot_greenfield_quot_golden_ceylon_100_paketikov.jpg?w=360&h=360&_c=1683862160",
                category: "Напитки",
                available: true),
        Product(name: "Кофе Nescafe Gold растворимый сублимированный 60 г",
                price: 1334,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/247214-kofe_nescafe_gold_rastvorimyi_sublimirovannyi_60_g.jpg?w=360&h=360&_c=1681295598",
                category: "Напитки",
                available: true),
        Product(name: "Напиток Fanta 1 л",
                price: 490,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/20801-napitok_fanta_1_l.jpg?w=360&h=360&_c=1684214221",
                category: "Напитки",
                available: true),
        Product(name: "Напиток Pepsi Zero газированный 1 л",
                price: 392,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/257782-napitok_pepsi_zero_gazirovannyi_1_l.jpg?w=360&h=360&_c=1683972490",
                category: "Напитки",
                available: true),
        Product(name: "Напиток Lava Lava безалкогольный сильногазированный ароматизированный Робо-Персик 500 мл",
                price: 713,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/290524-napitok_lava_lava_bezalkogolnyi_silnogazirovannyi_aromatizirovannyi_robo-persik_500_ml.jpg?w=360&h=360&_c=1684235408",
                category: "Напитки",
                available: true),
        Product(name: "Напиток безалкогольный сильногазированный ароматизированный Лемунтант 500 мл",
                price: 713,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/290522-napitok_bezalkogolnyi_silnogazirovannyi_aromatizirovannyi_lemuntant_500_ml.jpg?w=360&h=360&_c=1684235408",
                category: "Напитки",
                available: true),
        Product(name: "Лимонад Lapochka Vitamin Water CBD имбирь и груша 330 мл",
                price: 1073,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/288821-limonad_lapochka_vitamin_water_cbd_imbir_i_grusha_330_ml.jpg?w=360&h=360&_c=1683689075",
                category: "Напитки",
                available: true),
        Product(name: "Лимонад Lapochka Vitamin Water Detox персик маракуйя 330 мл",
                price: 910,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/288820-limonad_lapochka_vitamin_water_detox_persik_marakuiya_330_ml.jpg?w=360&h=360&_c=1683689075",
                category: "Напитки",
                available: true),
        Product(name: "Вода Okf газированная со вкусом Зелёного яблока 350 мл",
                price: 764,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/284647-voda_okf_gazirovannaya_so_vkusom_zel_nogo_yabloka_350_ml.jpg?w=360&h=360&_c=1683689080",
                category: "Напитки",
                available: true),
        Product(name: "Комбуча Dear Kombucha Mojito 250 мл",
                price: 1215,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/290838-kombucha_dear_kombucha_mojito_250_ml.jpg?w=360&h=360&_c=1684383641",
                category: "Напитки",
                available: true),
        Product(name: "Комбуча Dear Kombucha Original 250 мл",
                price: 1215,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/257368-kombucha_dear_kombucha_original_330_ml.jpg?w=360&h=360&_c=1683010611",
                category: "Напитки",
                available: true),
        Product(name: "Комбуча Dear Kombucha Coffee 330 мл",
                price: 1215 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/257375-kombucha_dear_kombucha_coffee_330_ml.jpg?w=360&h=360&_c=1681884106",
                category: "Напитки",
                available: true),
        Product(name: "Комбуча Os Kombucha Малина 500 мл",
                price: 1385 ,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/265710-kombucha_os_kombucha_malina_500_ml.jpg?w=360&h=360&_c=1681884107",
                category: "Напитки",
                available: true),
        Product(name: "Лимонад Rawish Имбирное пиво ж/б 330 мл",
                price: 1042,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/280008-limonad_rawish_imbirnoe_pivo_330_ml.jpg?w=360&h=360&_c=1684388080",
                category: "Напитки",
                available: true),
        Product(name: "Тоник Rawish Цветочно-ягодный ж/б 330 мл",
                price: 1042,
                image: "https://arbuz.kz/image/s3/arbuz-kz-products/280006-tonik_rawish_cvetochno-yagodnyi_330_ml.jpg?w=360&h=360&_c=1684388080",
                category: "Напитки",
                available: true)
    ]
}
