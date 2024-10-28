//
//  PokemonDetail.swift
//  PokemonIntroduceApp
//
//  Created by 王宜婕 on 2024/10/27.
//


struct Pokemon{
    var 編號: String
    var number: Int
    var 名稱: String
    var 分類: String
    var 特性: String
    var 屬性: [String]
    var imagename: String
}


var Pokemons: [Pokemon] = [
    Pokemon(編號: "025",number: 0, 名稱: "皮卡丘", 分類: "鼠寶可夢", 特性: "靜電", 屬性: ["電"], imagename: "皮卡丘"),
    Pokemon(編號: "001",number: 1, 名稱: "妙蛙種子", 分類: "種子寶可夢", 特性: "茂盛", 屬性: ["草","毒"], imagename: "妙蛙種子"),
    Pokemon(編號: "002",number: 2, 名稱: "妙蛙草", 分類: "種子寶可夢", 特性: "茂盛", 屬性: ["草","毒"], imagename: "妙蛙草"),
    Pokemon(編號: "003",number: 3, 名稱: "妙蛙花", 分類: "種子寶可夢", 特性: "茂盛", 屬性: ["草","毒"], imagename: "妙蛙花"),
    Pokemon(編號: "004",number: 4, 名稱: "小火龍", 分類: "蜥蜴寶可夢", 特性: "猛火", 屬性: ["火"], imagename: "小火龍"),
    Pokemon(編號: "005",number: 5, 名稱: "火恐龍", 分類: "火焰寶可夢", 特性: "猛火", 屬性: ["火"], imagename: "火恐龍"),
    Pokemon(編號: "006",number: 6, 名稱: "噴火龍", 分類: "火焰寶可夢", 特性: "猛火", 屬性: ["火","飛行"], imagename: "噴火龍"),
    Pokemon(編號: "007",number: 7, 名稱: "傑尼龜", 分類: "小龜寶可夢", 特性: "激流", 屬性: ["水"], imagename: "傑尼龜"),
    Pokemon(編號: "008",number: 8, 名稱: "卡咪龜", 分類: "龜寶可夢", 特性: "激流", 屬性: ["水"], imagename: "卡咪龜"),
    Pokemon(編號: "009",number: 9, 名稱: "水箭龜", 分類: "甲殼寶可夢", 特性: "激流", 屬性: ["水"], imagename: "水箭龜"),

]




var fires:[Pokemon] = []

var waters:[Pokemon] = []

var moods:[Pokemon] = []

var elecs:[Pokemon] = []


func typeAdd(){
    for i in 0...Pokemons.count - 1{
        if Pokemons[i].屬性.contains("水"){
            waters.append(Pokemons[i])
        }
        else if Pokemons[i].屬性.contains("火"){
            fires.append(Pokemons[i])
        }
        else if Pokemons[i].屬性.contains("草"){
            moods.append(Pokemons[i])
        }
        else if Pokemons[i].屬性.contains("電"){
            elecs.append(Pokemons[i])
        }
    }
}


