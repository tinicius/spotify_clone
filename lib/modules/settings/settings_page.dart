import 'package:flutter/material.dart';
import 'package:spotify_clone/modules/settings/components/settings_item.dart';
import 'package:spotify_clone/modules/settings/components/settings_perfil.dart';
import 'package:spotify_clone/modules/settings/components/setttings_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurar'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [
            SettingsPerfil(),
            SetttingsTitle(title: "Economia de Dados"),
            SettingsItem(
              title: "Economia de Dados",
              subtitle:
                  "Define a qualidade da música como baixa (equivalente a 24 kbit/s) e desativa o Canva dos artistas",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Somente o áudio dos podcasts",
              subtitle: "Salva apenas o áudio dos poscasts de vídeo",
              isOnOff: true,
            ),
            SizedBox(
              height: 20,
            ),
            SetttingsTitle(title: "Conta"),
            SettingsItem(
              title: "E-mail",
              subtitle: "hutlun2014@gmail.com",
            ),
            SizedBox(
              height: 20,
            ),
            SetttingsTitle(title: "Reprodução"),
            SettingsItem(
              title: "Modo Offline",
              subtitle:
                  "Quando você fica offline, só pode tocar as músicas e podcasts baixados",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Sem pausas",
              subtitle: "Permite a reprodução sem pausas",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Auto mix",
              subtitle:
                  "Permite transições graduais entre as músicas de uma playslist",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Permitir a reprodução de conteúdo explícito",
              subtitle: "Ative para que conteúdo explícito seja reproduzido",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Mostrar músicas indisponíveis",
              subtitle: "Mostrar músicas que não podem ser tocadas",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Normalizar o volume",
              subtitle: "Definir o mesmo nível de volume para todas as faixas",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Pular silêncio",
              subtitle: "Elimina as pausas nos podcasts",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Áudio mono",
              subtitle:
                  "Faz com que os alto-falantes esquerdo e direito toquem o mesmo áudio",
              isOnOff: true,
            ),
            SettingsItem(
              title: "Status de transmissão",
              subtitle:
                  "Permitir que outros aplicativos em seu dispositivo vejam o que você está ouvindo",
              isOnOff: true,
            ),
            SettingsItem(
              title: "AutoPlay",
              subtitle:
                  "Continue escutando faixas parecidas quando a música acabar",
              isOnOff: true,
            ),
            SizedBox(
              height: 20,
            ),
            SetttingsTitle(title: "Sobre"),
            SettingsItem(
              title: "Versão",
              subtitle: "0.1.0",
            ),
            SettingsItem(
              title: "Software de terceiros",
              subtitle: "Software que nos ajudou",
            ),
            SettingsItem(
              title: "Termos e condições",
              subtitle: "Tudo oque você precisa saber.",
            ),
            SettingsItem(
              title: "Política de privacidade",
              subtitle: "Imporante para todos nós.",
            ),
            SettingsItem(
              title: "Suporte",
              subtitle: "Obtenha ajuda nossa e da comunidade",
            ),
          ],
        ),
      ),
    );
  }
}
