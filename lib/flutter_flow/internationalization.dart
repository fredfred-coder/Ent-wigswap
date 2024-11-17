import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Profil
  {
    'bifccxvt': {
      'fr': 'compte',
      'en': 'account',
    },
    '9yw8cuwa': {
      'fr': 'Paramètres',
      'en': 'setting',
    },
    '4qzdq5vd': {
      'fr': 'Paiement',
      'en': 'Payements',
    },
    'hv6fh6qn': {
      'fr': 'Déconnexion',
      'en': 'LogOut',
    },
    's9t4txea': {
      'fr': 'Modifier le profil',
      'en': 'Edit Profile',
    },
    'i72x578u': {
      'fr': 'Business',
      'en': 'Business',
    },
    'x56gfdn6': {
      'fr': 'Vends ta Perruque',
      'en': 'Sell your Wig',
    },
    'yb68agtl': {
      'fr': 'Ma Liste',
      'en': 'My List',
    },
    'xq859ino': {
      'fr': 'Mes Favorits',
      'en': 'My favorites',
    },
    'ua6lks9j': {
      'fr': 'Fil Actualité',
      'en': 'Fil Actuality',
    },
    'qbw2la55': {
      'fr': 'Chat ',
      'en': 'Chat',
    },
    'b2uvslrg': {
      'fr': 'Profil',
      'en': 'Profile',
    },
    'k3nz8c8b': {
      'fr': 'Profil',
      'en': 'Profile',
    },
  },
  // Profile08
  {
    'f30f8mx8': {
      'fr': 'Paramètres',
      'en': 'Settings',
    },
    'ulq649gj': {
      'fr': 'Mot de Passe Oublié',
      'en': 'Forget Passewoord',
    },
    'y6banue2': {
      'fr': 'Communauté de Chat',
      'en': 'Chat Communyty',
    },
    'rfvhoqhf': {
      'fr': 'Paramètres du Profil',
      'en': 'Profil Setting',
    },
    't61t7fxv': {
      'fr': 'Paramètres de Notification',
      'en': 'Notification Settings',
    },
    'mner9m6c': {
      'fr': 'Déconnection',
      'en': 'Log Out of account',
    },
    'bltll6fs': {
      'fr': 'Titre de la Page',
      'en': 'Page Title',
    },
    'r5ujgt03': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // CreateIdUsers
  {
    'y764ocjv': {
      'fr': 'Nom Complet',
      'en': 'Full name',
    },
    '5gwy5zgk': {
      'fr': 'Numéro de Téléph',
      'en': 'Phone Number',
    },
    '06ukljc6': {
      'fr': 'Pays',
      'en': 'Country',
    },
    'gfaikg4k': {
      'fr': 'Ville',
      'en': 'City',
    },
    '8dj4nprc': {
      'fr': 'Email',
      'en': 'Email',
    },
    'v9y6te7i': {
      'fr': 'Langue',
      'en': 'Language',
    },
    'parkbeeu': {
      'fr': 'UserID',
      'en': 'UserID',
    },
    'dyndgafv': {
      'fr': 'Soumettre le Formulaire',
      'en': 'Submit Form',
    },
    'vvousrwp': {
      'fr': 'Merci d\'entrer le nom complet',
      'en': 'Please enter the patients full name',
    },
    '7ncwn4zs': {
      'fr': 'Merci de choisir une option dans la Dropbox',
      'en': 'Please choose an option from the dropdown',
    },
    'autndo2w': {
      'fr': 'Merci d\'entrer votre âge',
      'en': 'Please enter an age for the patient.',
    },
    'uxqq0pk2': {
      'fr': 'Merci de choisir une option dan',
      'en': 'Please choose an option from the dropdown',
    },
    'cxmngxjh': {
      'fr': 'Merci de choisir une option dans la dropbox\n',
      'en': 'Please choose an option from the dropdown',
    },
    'es5drerz': {
      'fr': 'Merci d\'introduire la date de votre annivers',
      'en': 'Please enter the date of birth of the patient.',
    },
    '4jxqa3ph': {
      'fr': 'Merci de  choisir une option dans la dropdown',
      'en': 'Please choose an option from the dropdow',
    },
    'solu96n6': {
      'fr': 'Champ Requis',
      'en': 'Field is required',
    },
    '0vbn2g8b': {
      'fr': 'Merci de choisir une option dans la dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'kj6yrl6c': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // auth_2_Create
  {
    'nj926le7': {
      'fr': 'Commencer',
      'en': 'Get Started',
    },
    'wg04waki': {
      'fr': 'Créer un compte en utilisant le formulaire ci-dessus',
      'en': 'Create an account by using the form below.',
    },
    'm0wxmhfv': {
      'fr': 'Email',
      'en': 'Email',
    },
    'n0vuca3j': {
      'fr': 'Mot de Passe',
      'en': 'Password',
    },
    'jwu91c2s': {
      'fr': 'Créer un compte',
      'en': 'Create Account',
    },
    'jzbcdhhs': {
      'fr': 'Ou vous connecter avec',
      'en': 'Or sign up with',
    },
    'anvzvc2k': {
      'fr': 'Continue with Google',
      'en': 'Continue with Google',
    },
    '0g5ygngp': {
      'fr': 'Continue with Apple',
      'en': 'Continue with Apple',
    },
    '6nnivb30': {
      'fr': 'Possédez-vous déjà un compte ?',
      'en': 'Already have an account? ',
    },
    '13ar25xy': {
      'fr': 'Identifiez-vous ici',
      'en': 'Sign in her',
    },
    'mr3pr7lc': {
      'fr': 'Authentification',
      'en': 'Auth',
    },
  },
  // auth_2_Login
  {
    'dn7ylqzt': {
      'fr': '\"Bienvenue',
      'en': '\"Welcome Back\"',
    },
    '9otbeso3': {
      'fr': '\"Remplissez les informations ci dessuous ---',
      'en': 'Fill out the information below in order to access your account.',
    },
    'n2iloiid': {
      'fr': 'Email',
      'en': 'Email',
    },
    '4w9o5rvt': {
      'fr': 'Mot de Passe',
      'en': 'Password',
    },
    'mxfat7to': {
      'fr': 'Se connecter',
      'en': 'Sign  in',
    },
    'jwtx3jfx': {
      'fr': 'Ou connectez',
      'en': 'Or sign in with',
    },
    'rqsvvgv9': {
      'fr': 'Continuer avec Google',
      'en': 'Continue with Google',
    },
    'yk9d7uzg': {
      'fr': 'Continue with Apple',
      'en': 'Continuer avec  Apple',
    },
    'gdpelkwp': {
      'fr': '  \"Pas encore de compte ?\"',
      'en': 'Don\'t have an account?  ',
    },
    'fd7mgjg6': {
      'fr': 'Créer  un compte',
      'en': 'Create Account',
    },
    'ym8y4aea': {
      'fr': 'Mot de passe oublié?',
      'en': 'Forgot Passwoord ?',
    },
    'aykf7o9u': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // auth_2_ForgotPassword
  {
    'rk5ybwa4': {
      'fr': 'Mot de Passe oublié',
      'en': 'Forgot Password',
    },
    '0dxlc9x9': {
      'fr':
          'Veuillez remplir votre e-mail ci-dessous afin de recevoir un lien de réinitialisation du mot de passe.',
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
    },
    '3olo1pxb': {
      'fr': 'Email',
      'en': 'Email',
    },
    '24iby6t6': {
      'fr': 'Envoyer le lien de réinitialisation',
      'en': 'Send Reset Link',
    },
    'lrqesqsg': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // auth_2_createProfile
  {
    '20rws4z4': {
      'fr': 'Home',
      'en': 'Homa',
    },
  },
  // auth_2_Profile
  {
    '8de5bgmo': {
      'fr': 'Your Account',
      'en': 'Your Account',
    },
    'xfladq47': {
      'fr': 'Edit Profile',
      'en': 'Edit Profile',
    },
    'dkgzf9wy': {
      'fr': 'App Settings',
      'en': 'App Settings',
    },
    'go1j0mmu': {
      'fr': 'Support',
      'en': 'assistance',
    },
    'fgztc5yh': {
      'fr': 'Terms of Service',
      'en': 'Terms of Service',
    },
    '83zj4xaq': {
      'fr': 'Log Out',
      'en': 'Log Out',
    },
    'd256z94i': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // auth_2_EditProfile
  {
    'l3d1pi2s': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // Gallerie_Perruques
  {
    'ckkqax8t': {
      'fr': 'Gallerie d\'images',
      'en': 'Gallerie Pictures',
    },
    'e8hn49t5': {
      'fr': 'Nom d\'utilisateur',
      'en': 'UserName',
    },
    'fu594zsc': {
      'fr': 'Retirer',
      'en': 'Remove',
    },
    'net39mc6': {
      'fr': 'Nom d\'utilisateur',
      'en': 'UserName',
    },
    '4ypa47au': {
      'fr': 'Retirer',
      'en': 'Remove',
    },
    'gv423z0t': {
      'fr': 'Description : ',
      'en': 'Description :',
    },
    '3wwq00lp': {
      'fr': 'Taille : ',
      'en': 'Size :',
    },
    'eqhhurdw': {
      'fr': 'Qualitée :',
      'en': 'Quality :',
    },
    'xebu7yas': {
      'fr': 'Prix  (Fcfa) : ',
      'en': 'Price ( Fcfa)',
    },
    '1g6r2ckg': {
      'fr': 'Statut : ',
      'en': 'Statut : ',
    },
    '6q4mrl93': {
      'fr': 'Voir',
      'en': 'View',
    },
    '0o7m56z8': {
      'fr': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    '6rehr8w9': {
      'fr': 'Voir',
      'en': 'View',
    },
    'ic4vb4pe': {
      'fr': 'Nom d\'utilisateur',
      'en': 'Username',
    },
    '5liujo7w': {
      'fr': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    'g6as74mg': {
      'fr': 'Voir',
      'en': 'View',
    },
    'lcatru5z': {
      'fr': 'Nom d\'utilisateur',
      'en': 'Username',
    },
    'l2t8s3c6': {
      'fr': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    '1nfuc4ra': {
      'fr': 'Voir',
      'en': 'View',
    },
    'p0vexcux': {
      'fr': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    'qz04ybyx': {
      'fr': 'Voir',
      'en': 'View',
    },
    '2cgoh9lo': {
      'fr': 'Accueil',
      'en': 'Welcome',
    },
  },
  // detailProduct
  {
    'rq6aa94x': {
      'fr': 'Gallerie Photos',
      'en': 'Photo Gallery',
    },
    'u8k7rzdy': {
      'fr': 'Prix :',
      'en': 'Price :',
    },
    'rtzzvkth': {
      'fr': '(Fcfa)',
      'en': '(Fcfa)',
    },
    'tnzopnca': {
      'fr': 'Description : ',
      'en': 'Description :',
    },
    'rhz6k0el': {
      'fr': 'Taille : ',
      'en': 'Size :',
    },
    'ti9qbvy0': {
      'fr': 'Qualitée : ',
      'en': 'Quality : ',
    },
    'h5ppw99b': {
      'fr': 'ProductID  : ',
      'en': 'Product ID  :',
    },
    'rrychuc8': {
      'fr': 'Statuts : ',
      'en': 'Statuts :',
    },
    '8f5coohj': {
      'fr': '\"Contacter le Vendeur\"',
      'en': '\"Contact Seller\"\n',
    },
    'ywbeto2l': {
      'fr': ' Contacter le Vendeur',
      'en': 'Contact Seller',
    },
    '87vg5r9e': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // VentePerruque
  {
    '1w8qqxx7': {
      'fr': 'Télécharger  une Photo',
      'en': 'Upload a Photo',
    },
    'ft94prgk': {
      'fr': 'Prix souhaité en Fcfa',
      'en': 'Desired price in Fcfa',
    },
    'qnedmuaq': {
      'fr': 'Description',
      'en': '',
    },
    'r2lizl62': {
      'fr': 'En quelques mots',
      'en': 'In a few words',
    },
    'rz5n49d6': {
      'fr': '8 à 20 cm',
      'en': '',
    },
    'czb57cba': {
      'fr': '22 à 30 cm',
      'en': '',
    },
    '1et9tk6s': {
      'fr': '30 à 42 cm',
      'en': '',
    },
    'n45i5h9w': {
      'fr': 'Autres',
      'en': 'Others',
    },
    'azsi10um': {
      'fr': 'Sélectionner votre Taille',
      'en': 'Select your Size',
    },
    'orn7s5qq': {
      'fr': 'Rechercher un article',
      'en': 'Search for an item...',
    },
    'lfrcexla': {
      'fr': 'Brésilienne',
      'en': '',
    },
    'vnltqo5z': {
      'fr': 'Indienne',
      'en': '',
    },
    'rjdmkv7o': {
      'fr': 'RawHair',
      'en': '',
    },
    '6hh4yu1d': {
      'fr': 'Autres',
      'en': 'Others',
    },
    '99krshhg': {
      'fr': 'Qualitée',
      'en': 'Quality',
    },
    '82oomagb': {
      'fr': 'Rechercher un article.....',
      'en': 'Search for an item...',
    },
    'msuqp89p': {
      'fr': 'Option 1',
      'en': '',
    },
    'laxtxwp1': {
      'fr': 'Category',
      'en': 'Category',
    },
    'l1yayisj': {
      'fr': 'Rechercher un article.....',
      'en': 'Search for an item...',
    },
    'kccr78mb': {
      'fr': 'Vends ta Perruque',
      'en': 'Sell your Wig',
    },
    'lpvedn6f': {
      'fr': 'Vente Perruque',
      'en': 'Sale Wig',
    },
    'tuve3gds': {
      'fr': 'Home',
      'en': '',
    },
  },
  // categoryPage
  {
    'hi1ry9ic': {
      'fr': 'Taille : ',
      'en': 'Size:',
    },
    'bep4mfxn': {
      'fr': 'qualitée : ',
      'en': 'quality : ',
    },
    'xriiztk2': {
      'fr': 'Product ID : ',
      'en': '',
    },
    'gbqaodch': {
      'fr': '\$11.00',
      'en': '',
    },
    '9b06t950': {
      'fr': 'Titre',
      'en': 'Title',
    },
    'gvyed0ty': {
      'fr': 'Subtext',
      'en': 'Sous-texte',
    },
    'zmltpo8z': {
      'fr': '\$11.00',
      'en': '',
    },
    'mxpzvuso': {
      'fr': 'Titre',
      'en': 'Title',
    },
    'mi4rpnau': {
      'fr': 'Sous-texte',
      'en': 'Subtext',
    },
    '0zbkfllw': {
      'fr': '\$11.00',
      'en': '',
    },
    'g314fv14': {
      'fr': 'Titre',
      'en': 'Title',
    },
    '8yv3ot8j': {
      'fr': 'Sous-texte',
      'en': ' Subtext',
    },
    'rdp66dij': {
      'fr': '\$11.00',
      'en': '',
    },
    '7zurugyp': {
      'fr': 'Titre',
      'en': 'Title',
    },
    'laojssam': {
      'fr': 'Sous-texte',
      'en': ' Subtext',
    },
    'k6hu2lbk': {
      'fr': '\$11.00',
      'en': '',
    },
    'b2xwech3': {
      'fr': 'Titre',
      'en': 'Title',
    },
    'wjhndue7': {
      'fr': 'Sous-texte',
      'en': 'Subtext',
    },
    'zpm1za8a': {
      'fr': '\$11.00',
      'en': '',
    },
    'qtx052cc': {
      'fr': 'Titre',
      'en': 'Title',
    },
    'o44vn4md': {
      'fr': 'Subtext',
      'en': '',
    },
    'x4mz6l6q': {
      'fr': '\$11.00',
      'en': '',
    },
    'qjgyj5eb': {
      'fr': 'Home',
      'en': '',
    },
  },
  // PictureGallery
  {
    '2cgxm0o7': {
      'fr': 'Télécharge la photo',
      'en': 'UpLoad Picture',
    },
    'i6oelnnp': {
      'fr': 'Gallery de photos',
      'en': 'Gallery Of Pictures',
    },
    'dr1g78ys': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Grow_up_Picture
  {
    'gdv18u9c': {
      'fr': 'Home',
      'en': '',
    },
  },
  // MyList
  {
    'nvalwcdi': {
      'fr': 'Description :',
      'en': 'Description :',
    },
    '1acnizy8': {
      'fr': 'Taille : ',
      'en': 'Size:',
    },
    'r3bzk0pq': {
      'fr': 'Quality : ',
      'en': 'Quality : ',
    },
    '1ebfhofh': {
      'fr': 'Delete  : ',
      'en': 'Effacer :',
    },
    'l6gtn0pe': {
      'fr': 'Prix (Fcfa ): ',
      'en': 'Price( Fcfa) :',
    },
    'ai13mqv1': {
      'fr': 'Ma liste',
      'en': 'My List',
    },
    'xhux7llp': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Faire_une_Offre
  {
    'm2g3prvt': {
      'fr': 'Ton Offre ',
      'en': 'Your Offer',
    },
    'l16jqesn': {
      'fr': 'En Fcfa :',
      'en': '',
    },
    'yafmo0zp': {
      'fr': 'Proposer',
      'en': '',
    },
    'g6bf147f': {
      'fr': 'Faire une Offre',
      'en': 'Make an Offer',
    },
    's9ytimmy': {
      'fr': 'Home',
      'en': '',
    },
  },
  // OffresFaites
  {
    'tcdeh4nt': {
      'fr': 'Bonjour ! Moi c\'est  ',
      'en': 'Hello ! I am ',
    },
    '421if796': {
      'fr': 'Dernière connexion',
      'en': 'Last connexion',
    },
    '1x73q7xn': {
      'fr': 'Votre',
      'en': 'Your',
    },
    'bzhmcs1t': {
      'fr': 'Offre',
      'en': 'Offer',
    },
    'u01p56cd': {
      'fr': 'Fcfa',
      'en': '',
    },
    '55e7agzg': {
      'fr': 'Nom : ',
      'en': 'Name : ',
    },
    'ocacdpqj': {
      'fr': 'Effacer: ',
      'en': 'Delete : ',
    },
    'g640bxks': {
      'fr': 'Offres Faites',
      'en': 'Offers Made',
    },
    'qmbm6ikr': {
      'fr': 'Home',
      'en': '',
    },
  },
  // OffreRecues
  {
    'b1fwh6r0': {
      'fr': 'Offres',
      'en': 'Offer',
    },
    '43pe6gn1': {
      'fr': 'Reçues',
      'en': 'Received',
    },
    'e0mzgq9q': {
      'fr': 'Fcfa',
      'en': '',
    },
    'xafqxg9k': {
      'fr': 'Nom: ',
      'en': 'Name : ',
    },
    'h7mv4a89': {
      'fr': 'Statut Offre :',
      'en': 'Offer Status',
    },
    '59v4j6ke': {
      'fr': 'Hello World',
      'en': '',
    },
    '4fwc1spk': {
      'fr': 'Nouvelle Offre: ',
      'en': 'New Offer :',
    },
    'k70a553o': {
      'fr': 'Nouvelle Offre: ',
      'en': 'New  Offer :',
    },
    'lrd9wiwg': {
      'fr': 'Envoyer une invitation',
      'en': 'Sent Invitation',
    },
    '0ntvtjel': {
      'fr': 'Effacer : ',
      'en': 'Delete : ',
    },
    '3gsfmgjf': {
      'fr': 'offres  Reçues',
      'en': 'Offers Received',
    },
    'ozt6h80u': {
      'fr': 'Home',
      'en': '',
    },
  },
  // ListeOffresFaites
  {
    '3f7bszda': {
      'fr': 'Offer Pric (Fcfa) : ',
      'en': 'Offer Price (Fcfa) : ',
    },
    'g3twwq5l': {
      'fr': 'Product ID : ',
      'en': 'Product ID :',
    },
    '9c8zreum': {
      'fr': 'Envoyer une Invitation',
      'en': 'Sent Invitation',
    },
    '90hdipna': {
      'fr': 'Effacer : ',
      'en': 'Delete : ',
    },
    'znykh0hi': {
      'fr': 'Liste Offres Faites',
      'en': 'List Of Offers Made',
    },
    '76awe3la': {
      'fr': 'Home',
      'en': '',
    },
  },
  // ListeOffresRecues
  {
    'vjsfuga8': {
      'fr': 'Prix Perruque en Fcfa : ',
      'en': 'Wig Price in Fcfa :',
    },
    'vgm545b6': {
      'fr': 'Offert Price  en Fcfa :',
      'en': 'Offered Price in Fcfa:',
    },
    '8fp4jtq6': {
      'fr': 'Traitement Offre',
      'en': 'Treatment Offer',
    },
    'x7l4hux1': {
      'fr': 'Effacer',
      'en': 'Delete',
    },
    '5to5mzga': {
      'fr': '\nNom Offre:',
      'en': 'Name Offer: ',
    },
    'se89r2bd': {
      'fr': 'Liste Offres Reçues',
      'en': '\nList of Offers Received',
    },
    'd26u707h': {
      'fr': 'Messages',
      'en': '',
    },
  },
  // swipeableStack
  {
    'aztaaoaz': {
      'fr': 'swipeableStack',
      'en': '',
    },
    '8uatliye': {
      'fr': 'Swipe',
      'en': 'Swipe',
    },
    'intyenh1': {
      'fr': 'Ma liste de Favorits',
      'en': 'My Favorites List',
    },
    '8re7jck3': {
      'fr': 'Home',
      'en': '',
    },
  },
  // chat_2_Details
  {
    '3ejfine8': {
      'fr': 'Group Chat',
      'en': 'Chat Group',
    },
    '04jbz1ou': {
      'fr': 'Home',
      'en': '',
    },
  },
  // chat_2_main
  {
    'fv5laon7': {
      'fr': 'Vous trouverez ci-dessous vos chats et vos discussions de groupe',
      'en': 'Below are your chats and group chats',
    },
    'tzl5mgu2': {
      'fr': 'Groupe  Chat',
      'en': 'Group Chat',
    },
    'deaju1le': {
      'fr': 'Mes Chats',
      'en': 'My Chats',
    },
    'tuwz5baa': {
      'fr': 'Chat',
      'en': '',
    },
  },
  // chat_2_InviteUsers
  {
    'zztd0fgv': {
      'fr': 'Inviter des amis',
      'en': 'Invite Friends',
    },
    'qfp9h4kl': {
      'fr': 'Selectionner',
      'en': 'Selected',
    },
    'rilw837k': {
      'fr': 'Inviter des amis',
      'en': 'Invite Friends',
    },
    'kpzcy382': {
      'fr':
          'Sélectionnez les utilisateurs ci-dessous pour démarrer une discussion.',
      'en': 'Select users from below to start a chat.',
    },
    'nwam5cow': {
      'fr': 'Home',
      'en': '',
    },
  },
  // image_Details
  {
    '5jpovyzr': {
      'fr': 'Home',
      'en': '',
    },
  },
  // support_TicketList
  {
    's7zfw626': {
      'fr': 'Vous trouverez ci-dessous une liste des tickets récemment créés',
      'en': 'Below are a list of recent tickets created',
    },
    '3yrlffph': {
      'fr': 'Ticket #: ',
      'en': '',
    },
    'ewksxpxz': {
      'fr': 'Support Tickets',
      'en': '',
    },
    's3ukpkpi': {
      'fr': 'Home',
      'en': '',
    },
  },
  // support_SubmitTicket
  {
    'lrmaexbj': {
      'fr': 'Créer un Ticket',
      'en': 'Create a Ticket',
    },
    'qxtids2d': {
      'fr': 'Remplissez le formulaire ci-dessous pour soumettre un ticket.',
      'en': 'Fill out the form below to submit a ticket.',
    },
    'y5u17wp3': {
      'fr': 'Appelez-nous',
      'en': 'Call Us',
    },
    '7x9esngp': {
      'fr': 'Envoyez-nous un e-mail',
      'en': 'Email Us',
    },
    'eseu4t20': {
      'fr': 'What is going on?',
      'en': 'Que se passe-t-il?',
    },
    'ko947hdm': {
      'fr': 'Brève description de ce qui se passe....',
      'en': 'Short Description of what is going on...',
    },
    'd8kuewgw': {
      'fr': 'Choisissez un niveau de priorité',
      'en': 'Choose a priority level',
    },
    '8lbl55ur': {
      'fr': 'Urgence',
      'en': 'Emergency',
    },
    'gjv8tor3': {
      'fr': 'Haute',
      'en': 'High',
    },
    'dq1t18uo': {
      'fr': 'Moyenne',
      'en': 'Medium',
    },
    't3zch374': {
      'fr': 'Basse',
      'en': 'Low',
    },
    '0tetk41z': {
      'fr': 'Basse',
      'en': 'Low',
    },
    'o56sh40l': {
      'fr': 'Télécharger une capture d\'écran',
      'en': 'Upload Screenshot',
    },
    'cdbwf1en': {
      'fr': 'Affecter un utilisateur',
      'en': 'Assign User',
    },
    'e97l0hs0': {
      'fr': 'Ajouter un utili',
      'en': 'Add User',
    },
    '9011bszo': {
      'fr': 'Soumettre le Ticket',
      'en': 'Submit Ticket',
    },
    'kx07o90x': {
      'fr': 'Home',
      'en': '',
    },
  },
  // support_TicketDetails
  {
    'qbse5krl': {
      'fr': 'Détails du billet',
      'en': 'Ticket Details',
    },
    'l5y8r0fp': {
      'fr': 'Ticket #: ',
      'en': 'Ticket #: ',
    },
    '5ydhl662': {
      'fr': 'Vous trouverez ci-dessous les détails de ce ticket d\'assistance.',
      'en': 'Below are the details of this support ticket.',
    },
    '0y8zlaoc': {
      'fr': 'Description',
      'en': '',
    },
    'x3o57q0o': {
      'fr': 'Soumis le',
      'en': 'Submitted on',
    },
    'vv9g4p7r': {
      'fr': 'Dernière modification',
      'en': 'Last Edited',
    },
    'tlgkh89x': {
      'fr': 'Status',
      'en': '',
    },
    'zog6xhfy': {
      'fr': 'En attente',
      'en': 'Pending',
    },
    'svym2vs7': {
      'fr': 'En cours',
      'en': 'In Progress',
    },
    '8zye0zhn': {
      'fr': 'Complet',
      'en': 'Complete',
    },
    '56iff137': {
      'fr': 'Soumise',
      'en': 'Submitted',
    },
    '8plyz2tq': {
      'fr': 'Veuillez sélectionner...',
      'en': 'Please select...',
    },
    'iy4t91e6': {
      'fr': 'Rechercher un article...',
      'en': 'Search for an item...',
    },
    '9k405cgl': {
      'fr': 'Affecté à',
      'en': 'Assigned to',
    },
    'haj3esh7': {
      'fr': 'Soumis par',
      'en': 'Submitted By',
    },
    'axi67a83': {
      'fr': 'Note du développeur (supprimer ceci)',
      'en': 'Developer Note (delete this)',
    },
    '9s6vn3at': {
      'fr':
          'Vous devrez modifier la référence ci-dessus pour créer un lien vers votre collection « utilisateurs » si vous ne l\'avez pas déjà, vous pouvez utiliser la collection ajoutée avec ce flux.',
      'en':
          'You will have to change the reference above to link to your \"users\" collection if you don\'t already have it, you can utilize the collection added with this flow.',
    },
    'orf1iim9': {
      'fr': 'Attribuer',
      'en': 'Assign',
    },
    '665p4vus': {
      'fr': 'Mettre à jour le ticket',
      'en': 'Update Ticket',
    },
  },
  // FavoriteSwipeableStack
  {
    'dqe4bhq0': {
      'fr': 'Prix : ',
      'en': 'Price: ',
    },
    'dd3ytk0x': {
      'fr': 'Quality : ',
      'en': 'Quality : ',
    },
    'y82j5hp8': {
      'fr': 'statut : ',
      'en': '',
    },
    '5rjyza43': {
      'fr': 'ProductId : ',
      'en': '',
    },
    'rfoxziq9': {
      'fr': 'Effacer',
      'en': 'Delete',
    },
    'cr3qvt8z': {
      'fr': '« Détails du produit »',
      'en': '\'Details Product\'',
    },
    'i7r2dfyu': {
      'fr': 'Favoris',
      'en': 'Favorites',
    },
    'zj47xft4': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Gallerie_PerruquesCopy
  {
    '522i4bsd': {
      'fr': 'Galerie Photos Détails',
      'en': 'Gallerie Pictures Détails',
    },
    'p32p1ly7': {
      'fr': 'Taille : ',
      'en': 'Size :',
    },
    'mhfhsdo8': {
      'fr': 'Qualitée :',
      'en': 'Quality :',
    },
    'nqfjxyqc': {
      'fr': 'Prix  (Fcfa) : ',
      'en': 'Price( Fcfa)',
    },
    'h07ftse0': {
      'fr': 'Statut : ',
      'en': '',
    },
    'y3dxir1x': {
      'fr': 'ProductID : ',
      'en': '',
    },
    'aaxpcjee': {
      'fr': 'Voir',
      'en': 'View',
    },
    '4uufblb4': {
      'fr': 'user@domainname.com',
      'en': '',
    },
    '7ot5ggy0': {
      'fr': 'Voir',
      'en': 'View',
    },
    'o87rtjvh': {
      'fr': 'Userna',
      'en': 'Username',
    },
    'ex460ryq': {
      'fr': 'user@domainname.com',
      'en': '',
    },
    'urvkyc7z': {
      'fr': 'Voir',
      'en': 'View',
    },
    'jp6qjjin': {
      'fr': 'Username',
      'en': '',
    },
    'n6939i5u': {
      'fr': 'user@domainname.com',
      'en': '',
    },
    '432kjqnv': {
      'fr': 'Voir',
      'en': 'View',
    },
    'cpwcstpd': {
      'fr': 'user@domainname.com',
      'en': '',
    },
    'jq75kb5u': {
      'fr': 'Voir',
      'en': 'View',
    },
    'k084j6ed': {
      'fr': 'Gallerie',
      'en': 'Gallery',
    },
  },
  // chat_ai_Screen
  {
    '6tadb08l': {
      'fr': 'Ai Chat',
      'en': '',
    },
    'j9k0uwb7': {
      'fr': 'Home',
      'en': '',
    },
  },
  // DialogueModalPaiement
  {
    'cm9q7nm6': {
      'fr':
          '\"Pour publier une perruque, veuillez d\'abord effectuer un payement de 1000 FCFA.\"',
      'en': '\"To post a wig, please first make a payment of 1000 FCFA.\"',
    },
    '69eh4xkj': {
      'fr': 'Payer',
      'en': 'Pay',
    },
    '3beda312': {
      'fr': 'Payer',
      'en': 'Pay',
    },
    '9kbgu517': {
      'fr': '1000  Fcfa',
      'en': '1000 Fcfa',
    },
    'e4285noe': {
      'fr': '1000 Fcfa',
      'en': '1000 Fcfa',
    },
    'qmp69toj': {
      'fr': 'Vendre',
      'en': 'Sell',
    },
  },
  // HomePageFilActuality
  {
    '8fr5ugsd': {
      'fr': 'Home',
      'en': '',
    },
  },
  // AddPageActuality
  {
    'w8gakjtr': {
      'fr': 'Ajouter une Photo',
      'en': 'Add a Photo',
    },
    'im8kcgpp': {
      'fr': 'Description...',
      'en': 'Description...',
    },
    'rsoz4ua6': {
      'fr': 'Publier un Post',
      'en': 'Publish a Post',
    },
    'ou16tgpy': {
      'fr': 'Créer un Post',
      'en': 'Create a Post',
    },
    'ywa6zsb2': {
      'fr': 'Home',
      'en': '',
    },
  },
  // postDetails
  {
    'swsy12o1': {
      'fr': '\"Laisser Ici Votre Commentaire\"',
      'en': '\"Leave Your Comment Here\"',
    },
    '5ogevi6l': {
      'fr': 'Poster',
      'en': 'Post',
    },
    '2h1wizz8': {
      'fr': 'Home',
      'en': '',
    },
  },
  // chatindividuel
  {
    'cj2hazfv': {
      'fr': 'Hello World',
      'en': 'Bonjour le monde',
    },
    'baatmq22': {
      'fr': 'Votre message',
      'en': 'Your message',
    },
    'lg1tw21a': {
      'fr': 'Chat Page',
      'en': '',
    },
    '1gckrw4l': {
      'fr': 'Chat ',
      'en': '',
    },
  },
  // IdVendeur
  {
    'aizzaph5': {
      'fr': '',
      'en': '',
    },
    'zbi7w736': {
      'fr': 'Invitation à chatter',
      'en': 'Chat  Invitation',
    },
  },
  // PaiementWave
  {
    'oe2b81lr': {
      'fr': 'Subscription',
      'en': 'Payement',
    },
    'nyxpijap': {
      'fr': '\"1000 Fcfa\"',
      'en': '\"1000 Fcfa\"',
    },
    '9wyi2fte': {
      'fr': '',
      'en': '',
    },
    '7usvv8at': {
      'fr': 'Payer',
      'en': 'Payement',
    },
    'qqovlweq': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // PaiementOrange
  {
    'rwc29pfs': {
      'fr': 'Subscription',
      'en': '',
    },
    'gc2qbni3': {
      'fr': '\"1000 Fcfa\"',
      'en': '\"1000 Fcfa\"',
    },
    'rt98hqhx': {
      'fr': '',
      'en': '',
    },
    'c7swdc7a': {
      'fr': 'Payer',
      'en': 'Payement',
    },
    'qbmx6gho': {
      'fr': 'Home',
      'en': '',
    },
  },
  // PayementRefuse
  {
    'zyl531e4': {
      'fr': '\"Votre Paiement à été Refusé\"',
      'en': '“Your payment has been declined”',
    },
    'bq5nrjby': {
      'fr': 'Page Title',
      'en': 'Payment successful',
    },
    'y4cfmlp9': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // VotrePaiementAccepte
  {
    'rhw4a6vw': {
      'fr': '\"votre payement est réussi\"',
      'en': '“your payment is successful”',
    },
    'lzscjkyk': {
      'fr': '\"Merci pour votre confiance\".',
      'en': '“Thank you for your trust.”',
    },
    'd3y6l8w4': {
      'fr': '\"Publier un article\"',
      'en': '“Publish an article”',
    },
    'ch6h9re3': {
      'fr': 'Payement réussi',
      'en': 'Payment successful',
    },
    'lzsmmw4j': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // editProfile_auth_2
  {
    'oa0qna30': {
      'fr': 'Change Photo',
      'en': 'Change Photo',
    },
    'kaaej7he': {
      'fr': 'Nom et prénom',
      'en': 'Full Name',
    },
    'r4clippb': {
      'fr': 'Votre nom complet...',
      'en': 'Your full name...',
    },
    '6jbl9bpy': {
      'fr': 'Directeur',
      'en': 'Director',
    },
    'ylzhx0f6': {
      'fr': 'Manager',
      'en': 'Manager',
    },
    'rc5elmk9': {
      'fr': 'Employe',
      'en': 'Employee',
    },
    'ik7mkoie': {
      'fr': 'Etudiant',
      'en': 'Student',
    },
    '1hiedzz6': {
      'fr': 'Votre  rôle',
      'en': 'Your Role',
    },
    'biro3nqd': {
      'fr': 'Rechercher un article...',
      'en': 'Search for an item...',
    },
    'czpv9jjd': {
      'fr': 'date de ',
      'en': 'date of Birhtday',
    },
    'd5lbum6x': {
      'fr': '',
      'en': 'Date Of Birthday',
    },
    'soz3fc2r': {
      'fr': 'Pays',
      'en': 'Country',
    },
    'yeb643mp': {
      'fr': 'Pays',
      'en': 'country',
    },
    '0d4munpw': {
      'fr': 'Ville',
      'en': 'City',
    },
    'xw4r1yrc': {
      'fr': 'Ville',
      'en': 'City',
    },
    'dv0h5vt3': {
      'fr': 'Langue',
      'en': 'Language',
    },
    'h8gcjnmj': {
      'fr': 'Numéro de Téléphone',
      'en': 'Phone Number',
    },
    'ksx20k36': {
      'fr': '',
      'en': 'Phone Number',
    },
    '65lhqh6i': {
      'fr': 'E_mail_adress',
      'en': '',
    },
    'omdeay5p': {
      'fr': 'E_mail_adress',
      'en': '',
    },
  },
  // chat_DetailsOverlay
  {
    'wsvf8kj5': {
      'fr': 'Détails du chat',
      'en': 'Chat Details',
    },
    'orjlv2cu': {
      'fr': 'ID de discussion de groupe :',
      'en': 'Group Chat ID: ',
    },
    'ktflp9li': {
      'fr': 'Dans ce chat',
      'en': 'In this chat',
    },
    'l3ibjl7a': {
      'fr': 'Fermer',
      'en': 'Close',
    },
  },
  // chat_ThreadComponent
  {
    'n75hhvhl': {
      'fr': 'Commencez à taper ici...',
      'en': 'Start typing here...',
    },
    's5jibvu7': {
      'fr': 'Vous devez entrer un message...',
      'en': 'You must enter a message...',
    },
    'f2e9bgfy': {
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // user_ListSmall
  {
    'j82vcw5a': {
      'fr': 'Moi',
      'en': 'ME',
    },
  },
  // deleteDialog
  {
    'f0pezgpy': {
      'fr': 'Options',
      'en': 'Options',
    },
    'gn5oyqsn': {
      'fr': 'Inviter des utilisateurs',
      'en': 'Invite Users',
    },
    'wy7qub0m': {
      'fr': 'Supprimer la discussion',
      'en': 'Delete Chat',
    },
    'wqlhk2dx': {
      'fr': 'Confirmer la suppression',
      'en': 'Confirm Delete',
    },
    'jam0fra2': {
      'fr': 'Vous ne pouvez pas annuler cette action.',
      'en': 'You can\'t undo this action.',
    },
    'i6htux2x': {
      'fr': 'Effacer',
      'en': 'Delete',
    },
  },
  // setPriority_Menu
  {
    'vp2oz63j': {
      'fr': 'Set Priority Level',
      'en': 'et Priority Level',
    },
    'rztmzes4': {
      'fr': 'Urg',
      'en': 'Emergency',
    },
    '1u7qamem': {
      'fr': '',
      'en': 'High',
    },
    'd2yw5hhv': {
      'fr': 'Moyenne',
      'en': 'Medium',
    },
    '8p56jmng': {
      'fr': 'Basse',
      'en': 'Low',
    },
  },
  // user_ListSmall_1
  {
    'hu40e6h4': {
      'fr': 'Moi',
      'en': 'ME',
    },
  },
  // user_List
  {
    'b91tzgtv': {
      'fr': 'Affecter un utilisateur',
      'en': 'Assign User',
    },
    'kgcolnqc': {
      'fr':
          'Sélectionnez un utilisateur dans la liste ci-dessous pour continuer.',
      'en': 'Select a user from the list below to continue.',
    },
    'taokba7t': {
      'fr': 'Fermer',
      'en': 'Close',
    },
  },
  // emptyList
  {
    'ap3vm4iv': {
      'fr': 'Ai Chat Active!',
      'en': 'Ai Chat Active!',
    },
    'vpxniozn': {
      'fr':
          'IMPORTANT !!! À faire :\nAccédez à l\'action ci-dessous et mettez à jour votre clé API pour que ce chat fonctionne.\n\nVous pouvez obtenir une clé API à l\'adresse :',
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
    },
    's1ozz4wa': {
      'fr': 'https://platform.openai.com',
      'en': '',
    },
    'jkv7uskc': {
      'fr': 'Regarder le tutoriel',
      'en': 'Watch Tutorial',
    },
  },
  // aiChat_Component
  {
    '04d6ujqa': {
      'fr': 'Copier la réponse',
      'en': 'Copy response',
    },
    'l3akpc6c': {
      'fr': 'Tapez quelque chose...',
      'en': 'Type something...',
    },
  },
  // Miscellaneous
  {
    '7u5rvrxn': {
      'fr': '\"Demander la permission\"',
      'en': '\"Request Permission\"',
    },
    'ftuzn8q3': {
      'fr':
          '  \"Pour enregistrer le son de la vidéo, cette application demande la permission pour accéder au micro\"',
      'en':
          'In order to record audio for video, this app requires permission to access the microphone',
    },
    'rm9dr15v': {
      'fr':
          ' \"Pour télécherger des photos, cette application demande la permission pour accéder à la librairie de photos\"',
      'en':
          'In Order to upload date, this app requires permission to access the photo library\"',
    },
    'cwhsx4e9': {
      'fr': '\"Recevez des notifications\"',
      'en': '\"Received notofications\"',
    },
    'ogegfd74': {
      'fr': '\"Demander la permission\"',
      'en': '\"Request permission\"',
    },
    '744xismu': {
      'fr': '\"Demander la permission\"',
      'en': '\"Request Permission\"',
    },
    'rqv7hi2f': {
      'fr': '',
      'en': '',
    },
    '7ko10gs4': {
      'fr': '',
      'en': '',
    },
    'gmp5ngtw': {
      'fr': '',
      'en': '',
    },
    'tfiz0hdh': {
      'fr': '',
      'en': '',
    },
    'mliiq79i': {
      'fr': '',
      'en': '',
    },
    '2qjypdcv': {
      'fr': '',
      'en': '',
    },
    'tq788qkh': {
      'fr': '',
      'en': '',
    },
    'uod52blc': {
      'fr': '',
      'en': '',
    },
    'wjljrx7j': {
      'fr': '',
      'en': '',
    },
    'k0j80d31': {
      'fr': '',
      'en': '',
    },
    '4v0a0xin': {
      'fr': '',
      'en': '',
    },
    '3t64ugs8': {
      'fr': '',
      'en': '',
    },
    'u6q7u927': {
      'fr': '',
      'en': '',
    },
    'h8t7upnd': {
      'fr': '',
      'en': '',
    },
    '5par2ncr': {
      'fr': '',
      'en': '',
    },
    'diagl6la': {
      'fr': '',
      'en': '',
    },
    'tpawip1p': {
      'fr': '',
      'en': '',
    },
    '8xdn1ag8': {
      'fr': '',
      'en': '',
    },
    'qqghlcwi': {
      'fr': '',
      'en': '',
    },
    'f152vd7x': {
      'fr': '',
      'en': '',
    },
    '5mhnegba': {
      'fr': '',
      'en': '',
    },
    '6c7x36cz': {
      'fr': '',
      'en': '',
    },
    'e8otrfif': {
      'fr': '',
      'en': '',
    },
    '27jhjuoa': {
      'fr': '',
      'en': '',
    },
    'togkj9ir': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
