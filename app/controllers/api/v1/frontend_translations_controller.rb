class Api::V1::FrontendTranslationsController < ApplicationController

  def index

    @translations_en = {

      'language-select.language.en': 'English',
      'language-select.language.de': 'Deutch',
      'general.menu.login':'Sign in',
      'general.menu.logout':'Logout',
      'general.menu.signup':'Signup',
      'general.menu.addwork':'Project',
      'addwork.package':'Da Quebinar',
      'addwork.choose_package':'this is Quebinars, we describe their value and why its worth to try them',
      'general.menu.inbox.index':'Inbox',
      'general.menu.stats.index':'My Stats',
      'general.menu.managecontent':'Manage Content',
      'general.menu.settings':'Settings',
      'general.menu.about':'About',
      'general.menu.explore':'EXPLORE',
      'general.required':'required',
      'general.discard':'discard',
      'general.done':'done',
      'general.send':'send',
      'general.save':'save',
      'general.name':'name',
      'general.country':'country',
      'general.zip':'ZIP',
      'general.about':'About us',
      'general.next':'next',
      'auth.email':'email',
      'addwork.size_error':'Your picture is too small. It must have more than 600 X 600 pixels',
      'settings.title':'Your settings',
      'settings.about_me':'About me',
      'settings.allow_message':'Allow users to message me',
      'stats.title':'Your statistics',
      'stats.overall':'Overall',
      'stats.rate_count':'Total number of rates',
      'stats.average':'Average score',
      'addwork.choose_category':'Choose a category of art your work is closest to. For example, a photo of a Picasso belongs probably to paintings. A photo of a cartoon probably to Illustration. It’s your choice. Please consider that the Feedback will be orientated at this category.',
      'addwork.choose_focus':'Choose the area where you would like to get most of feedback. You can choose between technical, emotional and intellectual aspects of your work. For technical focus the feedback will consider the quality of the composition, forms, colors and so on. You can also ask for emotional aspects of your work. The feedback will than consider which emotions the viewer feels looking at your work. Or you can ask for intellectual aspects. In this case you will get feedback about the interpretation of your idea behind the image. Choose the area where you would like to get most of feedback. You can choose between technical, emotional and intellectual aspects of your work. For technical focus the feedback will consider the quality of the composition, forms, colors and so on. You can also ask for emotional aspects of your work. The feedback will than consider which emotions the viewer feels looking at your work. Or you can ask for intellectual aspects. In this case you will get feedback about the interpretation of your idea behind the image.',
      'addwork.work_title':' What’s the name of your work?',
      'addwork.work_description':'describe your work',
      'addwork.crop':'crop',
      'addwork.title_start':"Let's start adding your work. Tap or click on the plus sign.",
      'addwork.category':'Category of art',
      'addwork.focus':'focus of your work',
      'auth.register':'register',
      'auth.password':'password',
      'auth.email.':'email',
      'auth.name.message': 'pick a name',
      'auth.error.login':'wrong email or password',
      'lang.title':'Your preferred language',
      'lang.message':'We will remember your choice. You can always change your preferred language in Settings after you register.',
      'slider.emo.10': 'AAAAHRG!',
      'slider.emo.20': 'ughhh',
      'slider.emo.30': 'GRRRR!',
      'slider.emo.40': 'F**YOU!',
      'slider.emo.50': 'WTF, oh dear!',
      'slider.emo.60': 'Woow',
      'slider.emo.70': 'aha, mmmm',
      'slider.emo.80': 'osome!',
      'slider.emo.90': 'HAHA!',
      'slider.emo.100': 'waaaahh',
      'slider.normal.10': 'only with prozac',
      'slider.normal.20': 'copykill',
      'slider.normal.30': 'nice try, bro',
      'slider.normal.40': '...',
      'slider.normal.50': 'hm...',
      'slider.normal.60': 'Im pleased',
      'slider.normal.70': 'keep working',
      'slider.normal.80': 'almost',
      'slider.normal.90': 'boohya',
      'slider.normal.100': 'MINDFUCK'

    }


    @translations_de = {
      'language-select.language.en': 'English',
      'language-select.language.de': 'Deutch',
      'addwork.package':'Da Quebinar',
      'addwork.choose_package':'this is Quebinars, we describe their value and why its worth to try them',
      'general.menu.login':'Anmelden',
      'general.menu.logout':'Abmelden',
      'general.menu.signup':'Registrieren',
      'general.menu.addwork':'Projekt',
      'general.menu.inbox.index':'Nachrichten',
      'general.menu.stats.index':'Meine Statistik',
      'general.menu.managecontent':'Werke verwalten',
      'general.menu.settings':'Einstellungen',
      'general.menu.about':'Über uns',
      'general.menu.explore':'ENTDECKEN',
      'general.required':'erforderlich',
      'general.discard':'verwerfen',
      'general.done':'Fertig',
      'general.send':'Senden',
      'general.save':'Speichern',
      'general.name':'Name',
      'general.country':'Land',
      'general.zip':'PLZ',
      'general.about':'Über dich',
      'general.next':'weiter',
      'addwork.size_error':'Dein Bild ist leider zu klein. Es muss mindestens 600 X 600 Pixel haben',
      'settings.title':'Deine Angaben',
      'settings.about_me':'Uber mich',
      'settings.allow_message':'Messaging erlaubt',
      'stats.title':'Deine Statistiken',
      'stats.overall':'Insgesamt',
      'stats.rate_count':'Anzahl Rates',
      'stats.average':'Durchschnittliche Bewertung',
      'addwork.choose_category':'Wähle eine Kunst-Kategorie für dein Werk',
      'addwork.choose_focus':'Wähle einen Bereich dein Werk, für den du Feedback haben möchtest',
      'addwork.work_title':'Wie heißt dein Werk?',
      'addwork.work_description':'Beschreibe dein Werk',
      'addwork.crop':'zuschneiden',
      'addwork.title_start':'Lass uns mit dem Hinzufügen deiner Arbeit beginnen. Tippe oder klicke auf das Pluszeichen.',
      'addwork.category':'Deine Kunst-Kategorie',
      'addwork.focus':'Dein Fokus liegt auf',
      'auth.register':'Registrieren',
      'auth.password':'Passwort',
      'auth.name.message': 'Wie heißt du?',
      'auth.email':'email',
      'auth.error.login':'falsche Email oder Passwort',
      'lang.title':'Deine bevorzugte Sprache',
      'lang.message':'Wir merken uns deine Wahl. Du kannst die Sprache in den Einstellungen ändern, nachdem du dich registriert hast.',
      'slider.emo.10': 'Ohneeein!',
      'slider.emo.20': 'Igitt!',
      'slider.emo.30': 'GRRRR!',
      'slider.emo.40': 'F**YOU!',
      'slider.emo.50': 'Och nö, echt jetzt?!',
      'slider.emo.60': 'Ok?!',
      'slider.emo.70': 'mmmmmmm',
      'slider.emo.80': 'YEAH!',
      'slider.emo.90': 'HAHA!',
      'slider.emo.100': 'waaaaahh',
      'slider.normal.10': 'Weitaaaaa!',
      'slider.normal.20': 'och nö',
      'slider.normal.30': 'gabs schon.',
      'slider.normal.40': 'bemüht.',
      'slider.normal.50': 'jein.',
      'slider.normal.60': 'ok, es wird...',
      'slider.normal.70': 'weitermachen!',
      'slider.normal.80': '...95%',
      'slider.normal.90': 'Kopfkino',
      'slider.normal.100': 'MINDFUCK'

    }

    render json:{'en':@translations_en, 'de':@translations_de}
  end


end
