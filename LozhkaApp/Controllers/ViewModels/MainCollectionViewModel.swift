//
//  MainCollectionViewModel.swift
//  LozhkaApp
//
//  Created by Ирина Улитина on 16/03/2019.
//  Copyright © 2019 Christian Benua. All rights reserved.
//

import Foundation
import UIKit

class DataHolder {
    public static var DishesJSON = """

                                    
                                    {
                                    "count": 2,
                                    "items": [
                                    {
                                    "name": "Бургер",
                                    "cost": 9900,
                                    "section": 0,
                                    "grams": [100],
                                    "kcal": 100,
                                    "elements": [18, 11, 20]
                                    },
                                    {
                                    "name": "Тортик",
                                    "cost": 99900,
                                    "section": 1,
                                    "grams": [100],
                                    "kcal": 100,
                                    "elements": [3, 5, 7]
                                    }
                                    ]
                                    }


                                    """
    
    public static var sectionsJSON = """
                                     {"count": 8, "items": ["ЭКОНОМ ОБЕД", "ДИЕТИЧЕСКИЕ БЛЮДА", "ХОЛОДНЫЕ ЗАКУСКИ", "ПЕРВЫЕ БЛЮДА", "ВТОРЫЕ БЛЮДА", "ГАРНИРЫ", "СОУСЫ / ХЛЕБ", "НАПИТКИ"]}
                                     """


    public static var oneDayDish =
    """
    {"count": 49, "items": [
    {"name": "Салат из квашеной капусты с репчатым луком, р/м","cost": 3500,"section": 0,"grams": [100.0]},
    {"name": "Суп рисовый по-румынски с курицей, сметаной","cost": 5000,"section": 0,"grams": [35.0, 250.0, 10.0]},
    {"name": "Котлета по-деревенски","cost": 9000,"section": 0,"grams": [100.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 0,"grams": [150.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 0,"grams": [200.0, 16.0]},
    {"name": "Каша молочная рисовая с маслом","cost": 4000,"section": 1,"grams": [250.0]},
    {"name": "Пудинг творожный с шоколадом, сгущенным молоком","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Пудинг творожный с шоколадом, сметаной","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Апельсин с клюквенным соусом","cost": 4000,"section": 2,"grams": [80.0, 20.0]},
    {"name": "Помидоры с брынзой, зеленью","cost": 4000,"section": 2,"grams": [50.0, 20.0]},
    {"name": "Салат Берлинский (ветчина, сыр, огурец, кукуруза)","cost": 5500,"section": 2,"grams": [100.0]},
    {"name": "Салат Домашний (с ветчиной)","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Салат Крабовый (с рисом)","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Салат из квашеной капусты с репчатым луком, р/м","cost": 3500,"section": 2,"grams": [100.0]},
    {"name": "Салат Китайский с овощами, р/м","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Свекла с черносливом, грецким орехом, чесноком, майонезом","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Суп рисовый по-румынски с курицей, сметаной","cost": 5000,"section": 3,"grams": [35.0, 250.0, 10.0]},
    {"name": "Щи из свежей капусты с курицей, сметаной","cost": 5000,"section": 3,"grams": [35.0, 250.0, 10.0]},
    {"name": "Жульен на сливках","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Гуляш из говядины","cost": 12500,"section": 4,"grams": [75.0, 50.0]},
    {"name": "Картофель, жаренный с колбасой с/к","cost": 8000,"section": 4,"grams": [150.0]},
    {"name": "Картофель, жаренный с грибами, луком","cost": 8500,"section": 4,"grams": [150.0]},
    {"name": "Котлета по-деревенски","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Котлета рыбная","cost": 10500,"section": 4,"grams": [100.0]},
    {"name": "Куры жареные","cost": 9500,"section": 4,"grams": [120.0]},
    {"name": "Свинина, запеченная с помидором, сыром, майонезом","cost": 14000,"section": 4,"grams": [80.0, 40.0]},
    {"name": "Эскалоп","cost": 15000,"section": 4,"grams": [100.0]},
    {"name": "Картофельное пюре","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Фасоль, тушенная с овощами","cost": 4500,"section": 5,"grams": [150.0]},
    {"name": "Горчица","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Кетчуп Хайнц","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Подлива мясная (Гуляш)","cost": 500,"section": 6,"grams": [50.0]},
    {"name": "Соус Тар-тар","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Хлеб пшеничный","cost": 300,"section": 6,"grams": [35.0]},
    {"name": "Хлеб ржаной","cost": 200,"section": 6,"grams": [35.0]},
    {"name": "Хрен столовый","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Горячий шоколад","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Кофе 3 в 1","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р без сахара","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р с сахаром","cost": 2500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Лимон","cost": 500,"section": 7,"grams": [7.0]},
    {"name": "Напиток клюквенный","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Сок в ассортименте","cost": 3500,"section": 7,"grams": [200.0]},
    {"name": "Чай без сахара","cost": 1500,"section": 7,"grams": [200.0]},
    {"name": "Чай с лимоном","cost": 1500,"section": 7,"grams": [200.0, 7.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Чай с сахаром и лимоном","cost": 1500,"section": 7,"grams": [200.0, 16.0, 7.0]}]}
    """
    
    public static var dishesByDay =
    """
    {"count": 6, "items": [{"count": 49, "items": [
    {"name": "Салат из квашеной капусты с репчатым луком, р/м","cost": 3500,"section": 0,"grams": [100.0]},
    {"name": "Суп рисовый по-румынски с курицей, сметаной","cost": 5000,"section": 0,"grams": [35.0, 250.0, 10.0]},
    {"name": "Котлета по-деревенски","cost": 9000,"section": 0,"grams": [100.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 0,"grams": [150.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 0,"grams": [200.0, 16.0]},
    {"name": "Каша молочная рисовая с маслом","cost": 4000,"section": 1,"grams": [250.0]},
    {"name": "Пудинг творожный с шоколадом, сгущенным молоком","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Пудинг творожный с шоколадом, сметаной","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Апельсин с клюквенным соусом","cost": 4000,"section": 2,"grams": [80.0, 20.0]},
    {"name": "Помидоры с брынзой, зеленью","cost": 4000,"section": 2,"grams": [50.0, 20.0]},
    {"name": "Салат Берлинский (ветчина, сыр, огурец, кукуруза)","cost": 5500,"section": 2,"grams": [100.0]},
    {"name": "Салат Домашний (с ветчиной)","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Салат Крабовый (с рисом)","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Салат из квашеной капусты с репчатым луком, р/м","cost": 3500,"section": 2,"grams": [100.0]},
    {"name": "Салат Китайский с овощами, р/м","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Свекла с черносливом, грецким орехом, чесноком, майонезом","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Суп рисовый по-румынски с курицей, сметаной","cost": 5000,"section": 3,"grams": [35.0, 250.0, 10.0]},
    {"name": "Щи из свежей капусты с курицей, сметаной","cost": 5000,"section": 3,"grams": [35.0, 250.0, 10.0]},
    {"name": "Жульен на сливках","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Гуляш из говядины","cost": 12500,"section": 4,"grams": [75.0, 50.0]},
    {"name": "Картофель, жаренный с колбасой с/к","cost": 8000,"section": 4,"grams": [150.0]},
    {"name": "Картофель, жаренный с грибами, луком","cost": 8500,"section": 4,"grams": [150.0]},
    {"name": "Котлета по-деревенски","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Котлета рыбная","cost": 10500,"section": 4,"grams": [100.0]},
    {"name": "Куры жареные","cost": 9500,"section": 4,"grams": [120.0]},
    {"name": "Свинина, запеченная с помидором, сыром, майонезом","cost": 14000,"section": 4,"grams": [80.0, 40.0]},
    {"name": "Эскалоп","cost": 15000,"section": 4,"grams": [100.0]},
    {"name": "Картофельное пюре","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Фасоль, тушенная с овощами","cost": 4500,"section": 5,"grams": [150.0]},
    {"name": "Горчица","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Кетчуп Хайнц","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Подлива мясная (Гуляш)","cost": 500,"section": 6,"grams": [50.0]},
    {"name": "Соус Тар-тар","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Хлеб пшеничный","cost": 300,"section": 6,"grams": [35.0]},
    {"name": "Хлеб ржаной","cost": 200,"section": 6,"grams": [35.0]},
    {"name": "Хрен столовый","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Горячий шоколад","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Кофе 3 в 1","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р без сахара","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р с сахаром","cost": 2500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Лимон","cost": 500,"section": 7,"grams": [7.0]},
    {"name": "Напиток клюквенный","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Сок в ассортименте","cost": 3500,"section": 7,"grams": [200.0]},
    {"name": "Чай без сахара","cost": 1500,"section": 7,"grams": [200.0]},
    {"name": "Чай с лимоном","cost": 1500,"section": 7,"grams": [200.0, 7.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Чай с сахаром и лимоном","cost": 1500,"section": 7,"grams": [200.0, 16.0, 7.0]}]},{"count": 47, "items": [
    {"name": "Винегрет овощной","cost": 3000,"section": 0,"grams": [100.0]},
    {"name": "Суп овощной с курицей и сметаной","cost": 5500,"section": 0,"grams": [35.0, 250.0, 10.0]},
    {"name": "Шницель рубленный по-африкански","cost": 9000,"section": 0,"grams": [100.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 0,"grams": [150.0]},
    {"name": "Чай с сахаром","cost": 1350,"section": 0,"grams": [330.0]},
    {"name": "Каша молочная пшенная с маслом","cost": 4000,"section": 1,"grams": [250.0]},
    {"name": "Пудинг творожный с курагой, сгущенным молоком","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Пудинг творожный с курагой, сметаной","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Винегрет овощной","cost": 3000,"section": 2,"grams": [100.0]},
    {"name": "Киви с взбитыми сливками","cost": 6000,"section": 2,"grams": [100.0]},
    {"name": "Салат Городнецкий (курица, салат, огурец, кукуруза)","cost": 5500,"section": 2,"grams": [100.0]},
    {"name": "Салат Домашний (с ветчиной)","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Салат Осенний","cost": 6000,"section": 2,"grams": [100.0]},
    {"name": "Салат из морской капусты с овощами, растительным маслом","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Салат из свежей капусты  со свежим огурцом, укропом, р/м","cost": 3000,"section": 2,"grams": [100.0]},
    {"name": "Суп овощной с курицей и сметаной","cost": 5500,"section": 3,"grams": [35.0, 250.0, 10.0]},
    {"name": "Суп-харчо с говядиной","cost": 6500,"section": 3,"grams": [35.0, 250.0]},
    {"name": "Жульен на сливках","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Гуляш из говядины","cost": 12500,"section": 4,"grams": [75.0, 50.0]},
    {"name": "Картофель, жаренный с грибами, луком","cost": 8500,"section": 4,"grams": [150.0]},
    {"name": "Котлета рыбная Краснодарская","cost": 10000,"section": 4,"grams": [100.0]},
    {"name": "Куры жареные","cost": 9500,"section": 4,"grams": [120.0]},
    {"name": "Филе кур, запеченное с помидором, сыром, майонезом","cost": 14000,"section": 4,"grams": [100.0, 50.0]},
    {"name": "Рыба отварная с лимоном","cost": 17000,"section": 4,"grams": [100.0, 10.0]},
    {"name": "Шницель рубленный по-африкански","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Баклажаны, тушенные с овощами","cost": 7000,"section": 5,"grams": [150.0]},
    {"name": "Картофельное пюре","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Горчица","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Кетчуп Хайнц","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Подлива мясная (Гуляш)","cost": 500,"section": 6,"grams": [50.0]},
    {"name": "Соус Тар-тар","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Хлеб пшеничный","cost": 300,"section": 6,"grams": [35.0]},
    {"name": "Хлеб ржаной","cost": 200,"section": 6,"grams": [35.0]},
    {"name": "Хрен столовый","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Горячий шоколад","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Компот из кураги","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Напиток клюквенный","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Кофе 3 в 1","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р без сахара","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р с сахаром","cost": 2500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Сок в ассортименте","cost": 3500,"section": 7,"grams": [200.0]},
    {"name": "Чай без сахара","cost": 1500,"section": 7,"grams": [200.0]},
    {"name": "Чай с лимоном","cost": 1500,"section": 7,"grams": [200.0, 7.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Чай с сахаром и лимоном","cost": 1500,"section": 7,"grams": [200.0, 16.0, 7.0]}]},{"count": 47, "items": [
    {"name": "Морковь по-корейски","cost": 2500,"section": 0,"grams": [150.0]},
    {"name": "Суп-пюре из шампиньонов","cost": 6000,"section": 0,"grams": [250.0]},
    {"name": "Капуста, тушенная с сосисками","cost": 7000,"section": 0,"grams": [250.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 0,"grams": [200.0, 16.0]},
    {"name": "Каша молочная геркулесовая с маслом","cost": 4000,"section": 1,"grams": [250.0]},
    {"name": "Пудинг творожный с курагой, сгущенным молоком","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Пудинг творожный с курагой, сметаной","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Апельсин с клюквенным соусом","cost": 4000,"section": 2,"grams": [80.0, 20.0]},
    {"name": "Морковь по-корейски","cost": 2500,"section": 2,"grams": [150.0]},
    {"name": "Салат Витаминный (овощи, фрукты)","cost": 3000,"section": 2,"grams": [100.0]},
    {"name": "Салат Лобио","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Салат Мозаика (краб. мясо, яйцо, огурец, горошек, кукуруза)","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Салат Оливье","cost": 5000,"section": 2,"grams": [100.0]},
    {"name": "Сельдь под шубой","cost": 6000,"section": 2,"grams": [100.0]},
    {"name": "Солянка мясная сборная со сметаной, лимоном, маслиной","cost": 8000,"section": 3,"grams": [40.0, 250.0, 10.0, 3.0, 1.0]},
    {"name": "Суп-пюре из шампиньонов","cost": 6000,"section": 3,"grams": [250.0]},
    {"name": "Жульен на сливках","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Капуста, тушенная с сосисками","cost": 7000,"section": 4,"grams": [250.0]},
    {"name": "Котлета Московская","cost": 8500,"section": 4,"grams": [100.0]},
    {"name": "Котлета рыбная Нежная","cost": 11500,"section": 4,"grams": [100.0]},
    {"name": "Куры жареные","cost": 9500,"section": 4,"grams": [120.0]},
    {"name": "Поджарка из филе кур","cost": 10500,"section": 4,"grams": [75.0, 50.0]},
    {"name": "Рыба отварная с лимоном","cost": 17000,"section": 4,"grams": [100.0, 10.0]},
    {"name": "Свинина, запеченная с помидором, сыром, майонезом","cost": 14000,"section": 4,"grams": [80.0, 40.0]},
    {"name": "Картофельное пюре","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Соте овощное","cost": 6500,"section": 5,"grams": [150.0]},
    {"name": "Горчица","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Кетчуп Хайнц","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Подлива мясная (Поджарка)","cost": 500,"section": 6,"grams": [50.0]},
    {"name": "Соус Тар-тар","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Соус томатный острый","cost": 1500,"section": 6,"grams": [50.0]},
    {"name": "Хлеб пшеничный","cost": 300,"section": 6,"grams": [35.0]},
    {"name": "Хлеб ржаной","cost": 200,"section": 6,"grams": [35.0]},
    {"name": "Хрен столовый","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Горячий шоколад","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Компот вишнёвый","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Компот из кураги","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Кофе 3 в 1","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р без сахара","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р с сахаром","cost": 2500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Сок в ассортименте","cost": 3500,"section": 7,"grams": [200.0]},
    {"name": "Чай без сахара","cost": 1500,"section": 7,"grams": [200.0]},
    {"name": "Чай с лимоном","cost": 1500,"section": 7,"grams": [200.0, 7.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Чай с сахаром и лимоном","cost": 1500,"section": 7,"grams": [200.0, 16.0, 7.0]}]},{"count": 47, "items": [
    {"name": "Морковь с сахаром, яблоком, курагой, р/м","cost": 2500,"section": 0,"grams": [100.0]},
    {"name": "Рассольник Ленинградский с курицей, сметаной","cost": 5000,"section": 0,"grams": [35.0, 250.0, 10.0]},
    {"name": "Котлета куриная, рубленная","cost": 7500,"section": 0,"grams": [100.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 0,"grams": [150.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 0,"grams": [200.0, 16.0]},
    {"name": "Каша молочная рисовая с маслом","cost": 4000,"section": 1,"grams": [250.0]},
    {"name": "Пудинг творожный с изюмом, сгущенным молоком","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Пудинг творожный с изюмом, сметаной","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Грейпфрут с взбитыми сливками","cost": 5000,"section": 2,"grams": [100.0]},
    {"name": "Морковь с сахаром, яблоком, курагой, р/м","cost": 2500,"section": 2,"grams": [100.0]},
    {"name": "Редис Дайкон с морковью, сыром и майонезом","cost": 5000,"section": 2,"grams": [100.0]},
    {"name": "Салат Золотая рыбка (крабовое мясо, кукуруза, капуста)","cost": 3000,"section": 2,"grams": [100.0]},
    {"name": "Салат Рыбный (с рисом)","cost": 6000,"section": 2,"grams": [100.0]},
    {"name": "Салат из квашеной капусты с клюквой, р/м","cost": 3500,"section": 2,"grams": [100.0]},
    {"name": "Сельдь с гарниром","cost": 8000,"section": 2,"grams": [70.0, 50.0]},
    {"name": "Рассольник Ленинградский с курицей, сметаной","cost": 5000,"section": 3,"grams": [35.0, 250.0, 10.0]},
    {"name": "Суп-пюре из брокколи","cost": 6000,"section": 3,"grams": [250.0]},
    {"name": "Жульен на сливках","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Биточек рыбный","cost": 10000,"section": 4,"grams": [100.0]},
    {"name": "Котлета куриная, рубленная","cost": 7500,"section": 4,"grams": [100.0]},
    {"name": "Куры жареные","cost": 9500,"section": 4,"grams": [120.0]},
    {"name": "Плов из индейки","cost": 11000,"section": 4,"grams": [250.0]},
    {"name": "Рыба отварная с лимоном","cost": 17000,"section": 4,"grams": [100.0, 10.0]},
    {"name": "Поджарка из свинины","cost": 10000,"section": 4,"grams": [75.0, 50.0]},
    {"name": "Свинина, запеченная с грибами, луком, сыром, майонезом","cost": 14500,"section": 4,"grams": [80.0, 40.0]},
    {"name": "Картофельное пюре","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Рис, припущенный в бульоне","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Фасоль стручковая, тушенная с овощами","cost": 5000,"section": 5,"grams": [150.0]},
    {"name": "Горчица","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Кетчуп Хайнц","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Подлива мясная (Поджарка)","cost": 500,"section": 6,"grams": [50.0]},
    {"name": "Соус Тар-тар","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Хлеб пшеничный","cost": 300,"section": 6,"grams": [35.0]},
    {"name": "Хлеб ржаной","cost": 200,"section": 6,"grams": [35.0]},
    {"name": "Хрен столовый","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Горячий шоколад","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Компот из кураги","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Напиток фруктовый","cost": 2000,"section": 7,"grams": [200.0]},
    {"name": "Кофе 3 в 1","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р без сахара","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р с сахаром","cost": 2500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Лимон","cost": 500,"section": 7,"grams": [7.0]},
    {"name": "Сок в ассортименте","cost": 3500,"section": 7,"grams": [200.0]},
    {"name": "Чай без сахара","cost": 1500,"section": 7,"grams": [200.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Чай с сахаром и лимоном","cost": 1500,"section": 7,"grams": [200.0, 16.0, 7.0]}]},{"count": 47, "items": [
    {"name": "Капуста б/к с овощами, растительным маслом","cost": 3500,"section": 0,"grams": [120.0]},
    {"name": "Суп гороховый с картофелем и копченостями","cost": 5000,"section": 0,"grams": [25.0, 250.0]},
    {"name": "Тефтели мясные, рубленные в красном соусе","cost": 9500,"section": 0,"grams": [115.0, 50.0]},
    {"name": "Макароны отварные с маслом","cost": 1500,"section": 0,"grams": [150.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 0,"grams": [200.0, 16.0]},
    {"name": "Каша молочная манная с маслом","cost": 4000,"section": 1,"grams": [250.0]},
    {"name": "Пудинг творожный с черносливом, сгущенным молоком","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Пудинг творожный с черносливом, сметаной","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Капуста б/к с овощами, растительным маслом","cost": 3500,"section": 2,"grams": [120.0]},
    {"name": "Овощи свежие с растительным маслом","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Салат Анжелика (ветчина, салат Китайский, лук, яйцо, майонез)","cost": 5500,"section": 2,"grams": [100.0]},
    {"name": "Салат Столичный (с курицей)","cost": 5000,"section": 2,"grams": [100.0]},
    {"name": "Салат из редиса со свежим огурцом, яйцом, майонезом","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Салат фруктовый с взбитыми сливками","cost": 5000,"section": 2,"grams": [100.0, 20.0]},
    {"name": "Свекла с черносливом, грецким орехом, чесноком, майонезом","cost": 4500,"section": 2,"grams": [100.0]},
    {"name": "Суп гороховый с картофелем и копченостями","cost": 5000,"section": 3,"grams": [25.0, 250.0]},
    {"name": "Суп картофельный с грибами, вермишелью и сметаной","cost": 5000,"section": 3,"grams": [250.0, 10.0]},
    {"name": "Жульен на сливках","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Говядина отварная","cost": 12000,"section": 4,"grams": [75.0]},
    {"name": "Оладьи из печени со сметаной","cost": 10000,"section": 4,"grams": [150.0, 20.0]},
    {"name": "Куры жареные","cost": 9500,"section": 4,"grams": [120.0]},
    {"name": "Поджарка из филе кур в сливочном соусе","cost": 10500,"section": 4,"grams": [75.0, 50.0]},
    {"name": "Рыба, запеченная с помидором, сыром, майонезом","cost": 16000,"section": 4,"grams": [80.0, 40.0]},
    {"name": "Свинина, запеченная по-барски","cost": 14000,"section": 4,"grams": [75.0, 60.0]},
    {"name": "Тефтели мясные, рубленные в красном соусе","cost": 9500,"section": 4,"grams": [115.0, 50.0]},
    {"name": "Кабачки, тушенные с овощами","cost": 6000,"section": 5,"grams": [150.0]},
    {"name": "Картофельное пюре","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Макароны отварные с маслом","cost": 1500,"section": 5,"grams": [150.0]},
    {"name": "Горчица","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Кетчуп Хайнц","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Соус сливочный","cost": 1500,"section": 6,"grams": [50.0]},
    {"name": "Соус Тар-тар","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Соус красный с кореньями","cost": 500,"section": 6,"grams": [50.0]},
    {"name": "Хлеб пшеничный","cost": 300,"section": 6,"grams": [40.0]},
    {"name": "Хлеб ржаной","cost": 200,"section": 6,"grams": [40.0]},
    {"name": "Хрен столовый","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Горячий шоколад","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Компот вишнёвый","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Компот из чернослива","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Кофе 3 в 1","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р без сахара","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р с сахаром","cost": 2500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Сок в ассортименте","cost": 3500,"section": 7,"grams": [200.0]},
    {"name": "Чай без сахара","cost": 1500,"section": 7,"grams": [200.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Чай с сахаром и лимоном","cost": 1500,"section": 7,"grams": [200.0, 16.0, 7.0]}]},{"count": 47, "items": [
    {"name": "Морковь с сахаром, яблоком, изюмом, р/м","cost": 2500,"section": 0,"grams": [100.0]},
    {"name": "Борщ из квашеной капусты с курицей и сметаной","cost": 5000,"section": 0,"grams": [250.0, 35.0, 10.0]},
    {"name": "Котлета Домашняя","cost": 8500,"section": 0,"grams": [100.0]},
    {"name": "Макароны отварные с маслом","cost": 1500,"section": 0,"grams": [150.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 0,"grams": [200.0, 16.0]},
    {"name": "Каша молочная Дружба с маслом","cost": 4000,"section": 1,"grams": [250.0]},
    {"name": "Пудинг творожный с шоколадом, сгущенным молоком","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Пудинг творожный с шоколадом, сметаной","cost": 6000,"section": 1,"grams": [150.0, 20.0]},
    {"name": "Морковь с сахаром, яблоком, изюмом, р/м","cost": 2500,"section": 2,"grams": [100.0]},
    {"name": "Салат Мясной","cost": 5000,"section": 2,"grams": [100.0]},
    {"name": "Салат Пикантный (крабовое мясо, сыр, овощи, яйцо)","cost": 6000,"section": 2,"grams": [130.0]},
    {"name": "Студень говяжий с хреном","cost": 10000,"section": 2,"grams": [150.0, 20.0]},
    {"name": "Салат Сезон (карбонат, огурец, зеленая фасоль, аджика)","cost": 6000,"section": 2,"grams": [100.0]},
    {"name": "Свекла с соленым огурцом, сыром, майонезом","cost": 4000,"section": 2,"grams": [100.0]},
    {"name": "Яблоко, запеченное с сахаром, корицей, клюквенным соусом","cost": 5000,"section": 2,"grams": [140.0, 20.0, 20.0]},
    {"name": "Борщ из квашеной капусты с курицей и сметаной","cost": 5000,"section": 3,"grams": [250.0, 35.0, 10.0]},
    {"name": "Суп полевой с мясным набором","cost": 5000,"section": 3,"grams": [25.0, 250.0]},
    {"name": "Жульен на сливках","cost": 9000,"section": 4,"grams": [100.0]},
    {"name": "Говядина отварная","cost": 12000,"section": 4,"grams": [75.0]},
    {"name": "Жаркое по-домашнему со свининой","cost": 11000,"section": 4,"grams": [50.0, 250.0]},
    {"name": "Котлета Домашняя","cost": 8500,"section": 4,"grams": [100.0]},
    {"name": "Куры жареные","cost": 9500,"section": 4,"grams": [120.0]},
    {"name": "Печень по-строгановски","cost": 7500,"section": 4,"grams": [75.0, 50.0]},
    {"name": "Рыба, жаренная под маринадом","cost": 15500,"section": 4,"grams": [80.0, 40.0]},
    {"name": "Шашлык из филе кур","cost": 13000,"section": 4,"grams": [100.0]},
    {"name": "Капуста, тушенная с овощами","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Картофельное пюре","cost": 3500,"section": 5,"grams": [150.0]},
    {"name": "Каша гречневая","cost": 2000,"section": 5,"grams": [150.0]},
    {"name": "Макароны отварные с маслом","cost": 1500,"section": 5,"grams": [150.0]},
    {"name": "Горчица","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Кетчуп Хайнц","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Соус Тар-тар","cost": 2000,"section": 6,"grams": [50.0]},
    {"name": "Соус сметанный с луком","cost": 1000,"section": 6,"grams": [50.0]},
    {"name": "Хлеб пшеничный","cost": 300,"section": 6,"grams": [35.0]},
    {"name": "Хлеб ржаной","cost": 200,"section": 6,"grams": [35.0]},
    {"name": "Хрен столовый","cost": 500,"section": 6,"grams": [10.0]},
    {"name": "Горячий шоколад","cost": 3000,"section": 7,"grams": [200.0]},
    {"name": "Кофе 3 в 1","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р без сахара","cost": 2500,"section": 7,"grams": [200.0]},
    {"name": "Кофе б/р с сахаром","cost": 2500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Лимон","cost": 500,"section": 7,"grams": [7.0]},
    {"name": "Напиток фруктовый","cost": 2000,"section": 7,"grams": [200.0]},
    {"name": "Сок в ассортименте","cost": 3500,"section": 7,"grams": [200.0]},
    {"name": "Чай без сахара","cost": 1500,"section": 7,"grams": [200.0]},
    {"name": "Чай с сахаром","cost": 1500,"section": 7,"grams": [200.0, 16.0]},
    {"name": "Чай с  лимоном","cost": 1500,"section": 7,"grams": [200.0, 7.0]},
    {"name": "Чай с сахаром и лимоном","cost": 1500,"section": 7,"grams": [200.0, 16.0, 7.0]}]}]}

    """
    
}

class MainCollectionViewModel {
    
    var day: Int = 0
    
    var currentGroupDishes: [[Dish]] {
        return groupedByDayAndSectionDishes[day]
        //return groupedDishes
    }
    
    var dishes: [Dish] = []
    
    var groupedDishes: [[Dish]] = [[]]
    var groupedByDayAndSectionDishes: [[[Dish]]] = []
    
    var sectionNames: [String] = []
    
    var dishesByDay: [[Dish]] = [[]]
    
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        
    }
        
    
    
    init() {
        print(Date().dayNumberOfWeek())
        self.day = (Date().dayNumberOfWeek() + 5) % 7
        print(self.day)
        do {
            self.dishesByDay = try JSONDecoder().decode(DayByDayDishes.self, from: DataHolder.dishesByDay.data(using: .utf8)!).dishes.compactMap({ (el) -> [Dish] in
                el.dishes
            })
            
            
            
            
 
            let sections: SectionsReader = try JSONDecoder().decode(SectionsReader.self, from: DataHolder.sectionsJSON.data(using: .utf8)!)
            self.sectionNames = sections.sections
            
            for i in 0..<dishesByDay.count {
                groupedByDayAndSectionDishes.append([[]])
                let lst = groupedByDayAndSectionDishes.count - 1
                for _ in 1..<sectionNames.count {
                    groupedByDayAndSectionDishes[lst].append([])
                }
                for el in dishesByDay[i] {
                    groupedByDayAndSectionDishes[i][el.section].append(el)
                }
            }
            /*
            self.dishes = (try JSONDecoder().decode(DishContainer.self, from: DataHolder.oneDayDish.data(using: .utf8)!)).dishes
            
            for _ in 1..<sectionNames.count {
                groupedDishes.append([])
            }
            
            for el in dishes {
                groupedDishes[el.section].append(el)
            }*/
        } catch let err {
            print(err)
            print(DataHolder.oneDayDish.prefix(upTo: String.Index(encodedOffset: 342)))
        }
    }
}
