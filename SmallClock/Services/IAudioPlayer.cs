using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmallClock.Services
{
    public interface IAudioPlayer
    {
        void PlayAlert();

        void PlayNotification();
    }
}
