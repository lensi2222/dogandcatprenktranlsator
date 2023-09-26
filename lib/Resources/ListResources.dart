import 'package:dogandcatprenktranlsator/Model/catModel.dart';
import 'package:dogandcatprenktranlsator/Model/dogModel.dart';
import 'package:dogandcatprenktranlsator/Resources/AudioResources.dart';
import 'package:dogandcatprenktranlsator/Resources/StringResources.dart';

import '../Model/fakeCallModel.dart';
import '../Model/trainingModel.dart';
import '../model/languageModel.dart';
import 'ImagesResources.dart';

List<LanguageModel> languageList = [
  LanguageModel(
    title: "Hindi",
    images: hindiImg,
  ),
  LanguageModel(
    title: "English",
    images: englishImg,
  ),
  LanguageModel(
    title: "French",
    images: frenchImg,
  ),
  LanguageModel(
    title: "spanish",
    images: spanishImg,
  ),
  LanguageModel(
    title: "Portuguese",
    images: portuImg,
  ),
  LanguageModel(
    title: "Indonesian",
    images: indoImg,
  ),
  LanguageModel(
    title: "Korean",
    images: koreanImg,
  ),
  LanguageModel(
    title: "Japanese",
    images: japanImg,
  ),
  LanguageModel(
    title: "Russian",
    images: russiaImg,
  ),
  LanguageModel(
    title: "Lao",
    images: laoImg,
  ),
];

List<CatModel> catList = [
  CatModel(title: lieCatText, images: happyCatImg, audio: cat01Audio),
  CatModel(title: loveCatText, images: happyCatImg, audio: cat02Audio),
  CatModel(title: hungryCatText, images: happyCatImg, audio: cat03Audio),
  CatModel(title: happyCatText, images: happyCatImg, audio: cat04Audio),
  CatModel(title: cryCatText, images: happyCatImg, audio: cat05Audio),
  CatModel(title: angryCatText, images: happyCatImg, audio: cat06Audio),
  CatModel(title: sadCatText, images: happyCatImg, audio: cat07Audio),
  CatModel(title: danceCatText, images: happyCatImg, audio: cat08Audio),
  CatModel(title: walkCatText, images: happyCatImg, audio: cat09Audio),
  CatModel(title: hyCatText, images: happyCatImg, audio: cat10Audio),
];
List<String> timerList = [
  '5',
  '30',
  '45',
  '60',
  '180',
  '300',
];
List<FakeCallModel> fakeCallList = [
  FakeCallModel(
    title: huskyFakeCallText,
    images: happyCatImg,
    video: videoHuskyVideo
  ),
  FakeCallModel(
    title: huskyStripedFakeCallText,
    images: happyDogImg,
    video: videoHuskyStripVideo
  ),
  FakeCallModel(
    title: britishShortHairCatFakeCallText,
    images: huskyImg,
    video: videoBritishVideo
  ),
  FakeCallModel(
    title: goldenFakeCallText,
    images: goldenImg,
    video: videoGoldenVideo
  ),
  FakeCallModel(
    title: catFakeCallText,
    images: fakeCatImg,
    video: videoCatVideo
  ),
];
List<TrainingModel> trainingDogList = [
  TrainingModel(
    subTitle: subTitleDogFoodText,
    title: titleDogFoodText,
    images: dogFoodImg,
  ),
  TrainingModel(
    title: titleDogPraiseText,
    subTitle: subTitleDogPraiseText,
    images: happyDogImg,
  ),
  TrainingModel(
    title: titleDogBitingText,
    subTitle: subTitleDogBitingText,
    images: huskyImg,
  ),
  TrainingModel(
    title: titleDogObedienceText,
    subTitle: subTitleDogObedienceText,
    images: goldenImg,
  ),
  TrainingModel(
    title: titleDogBarkingText,
    subTitle: subTitleDogBarkingText,
    images: fakeCatImg,
  ),
];
List<TrainingModel> trainingCatList = [
  TrainingModel(
    subTitle: subTitleCatFeedingText,
    title: titleCatFeedingText,
    images: catFoodImg,
  ),
  TrainingModel(
    title: titleCatPlayingCatText,
    subTitle: subTitleCatPlayingCatText,
    images: catPlayingImg,
  ),
  TrainingModel(
    title: titleCatPettingCatText,
    subTitle: subTitleCatPettingCatText,
    images: catPettingImg,
  ),
  TrainingModel(
    title: titleCatScratchingNeedsText,
    subTitle: subTitleCatScratchingNeedsText,
    images: catImg,
  ),
];
List<DogModel> dogDetailList = [
  DogModel(
    audio: dogAgreeAudio,
    title: agreeDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogAngryAudio,
    title: angryDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogBeggingAudio,
    title: beggingDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogCryLyingAudio,
    title: cryLyingDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogDanceAudio,
    title: danceDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogExhaustedAudio,
    title: exhaustedDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogHandClapAudio,
    title: handClapDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogHappyAudio,
    title: happyDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogHappyWalkAudio,
    title: happyWalkDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogHyAudio,
    title: hyDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogHyFenceAudio,
    title: hyFaceDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogHungryAudio,
    title: hungryDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogLieAudio,
    title: lieDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogLoveAudio,
    title: loveDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogNoAudio,
    title: noDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogPetAudio,
    title: petDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogRaiseHandAudio,
    title: raiseHandDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogSadAudio,
    title: sadDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogScaredAudio,
    title: scaredDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogScratchAudio,
    title: scratchDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogShyAudio,
    title: shyDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogSoftAngryAudio,
    title: softBeggingDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogSoftBeggingAudio,
    title: softBeggingDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogStartleAudio,
    title: startleDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogSuperAngryAudio,
    title: superAngryDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogWonderAudio,
    title: wonderDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogWowAudio,
    title: wowDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogYeahAudio,
    title: yeahDogText,
    images: huskyImg,
  ),
  DogModel(
    audio: dogYesAudio,
    title: yesDogText,
    images: huskyImg,
  ),
];
