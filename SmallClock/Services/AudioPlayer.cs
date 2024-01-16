using Plugin.Maui.Audio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmallClock.Services
{
    public class AudioPlayer : IAudioPlayer
    {
        private IAudioManager _audioManager;

        public AudioPlayer(IAudioManager audioManager )
        {
            _audioManager = audioManager;
        }

        public void PlayAlert()
        {
            string audio = "alertSound.mp3";
            PlayAudio( audio );
        }

        public void PlayNotification()
        {
            string audio = "notificationSound.mp3";
            PlayAudio( audio );
        }

        private async void PlayAudio(string audio )
        {
            var stream = await FileSystem.OpenAppPackageFileAsync( audio );
            var audioPlayer = _audioManager.CreatePlayer( stream );
            audioPlayer.Play();
        }
    }
}
