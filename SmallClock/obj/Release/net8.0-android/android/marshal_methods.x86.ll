; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [118 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [236 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 109
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 51
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 105
	i32 136584136, ; 7: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 8: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 57
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 75
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 88
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 53
	i32 321963286, ; 14: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 64
	i32 379916513, ; 16: System.Threading.Thread.dll => 0x16a510e1 => 109
	i32 385762202, ; 17: System.Memory.dll => 0x16fe439a => 96
	i32 395744057, ; 18: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 19: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 20: System.Collections => 0x1a61054f => 85
	i32 450948140, ; 21: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 63
	i32 456227837, ; 22: System.Web.HttpUtility.dll => 0x1b317bfd => 111
	i32 469710990, ; 23: System.dll => 0x1bff388e => 113
	i32 489220957, ; 24: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 25: System.ObjectModel => 0x1dbae811 => 102
	i32 513247710, ; 26: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 45
	i32 538707440, ; 27: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 28: Microsoft.Extensions.Logging => 0x20216150 => 42
	i32 597488923, ; 29: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 30: Xamarin.AndroidX.CustomView => 0x2568904f => 61
	i32 627931235, ; 31: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 32: System.Collections.Concurrent => 0x2814a96c => 82
	i32 759454413, ; 33: System.Net.Requests => 0x2d445acd => 100
	i32 775507847, ; 34: System.IO.Compression => 0x2e394f87 => 93
	i32 777317022, ; 35: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 36: Microsoft.Extensions.Options => 0x2f0980eb => 44
	i32 823281589, ; 37: System.Private.Uri.dll => 0x311247b5 => 103
	i32 830298997, ; 38: System.IO.Compression.Brotli => 0x317d5b75 => 92
	i32 869139383, ; 39: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 40: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 41: System.ComponentModel.Primitives.dll => 0x35e25008 => 86
	i32 918734561, ; 42: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 43: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 44: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 64
	i32 990727110, ; 45: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 46: System.Collections.dll => 0x3b2c715c => 85
	i32 1012816738, ; 47: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 74
	i32 1028951442, ; 48: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 41
	i32 1035644815, ; 49: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 54
	i32 1043950537, ; 50: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 51: System.Linq.Expressions.dll => 0x3e444eb4 => 94
	i32 1052210849, ; 52: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 66
	i32 1082857460, ; 53: System.ComponentModel.TypeConverter => 0x408b17f4 => 87
	i32 1084122840, ; 54: Xamarin.Kotlin.StdLib => 0x409e66d8 => 79
	i32 1098259244, ; 55: System => 0x41761b2c => 113
	i32 1108272742, ; 56: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 57: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 58: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 59: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 60: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 71
	i32 1214827643, ; 61: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1260983243, ; 62: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 63: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 62
	i32 1308624726, ; 64: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 65: System.Linq => 0x4eed2679 => 95
	i32 1336711579, ; 66: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1347751866, ; 67: Plugin.Maui.Audio => 0x50550fba => 52
	i32 1373134921, ; 68: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 69: Xamarin.AndroidX.SavedState => 0x52114ed3 => 74
	i32 1406073936, ; 70: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 58
	i32 1430672901, ; 71: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 72: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 73: System.Collections.Immutable.dll => 0x5718a9ef => 83
	i32 1462112819, ; 74: System.IO.Compression.dll => 0x57261233 => 93
	i32 1469204771, ; 75: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 55
	i32 1470490898, ; 76: Microsoft.Extensions.Primitives => 0x57a5e912 => 45
	i32 1479771757, ; 77: System.Collections.Immutable => 0x5833866d => 83
	i32 1480492111, ; 78: System.IO.Compression.Brotli.dll => 0x583e844f => 92
	i32 1517633864, ; 79: SmallClock.dll => 0x5a754148 => 81
	i32 1526286932, ; 80: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 81: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 108
	i32 1622152042, ; 82: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 68
	i32 1624863272, ; 83: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 77
	i32 1634654947, ; 84: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 85: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 60
	i32 1639515021, ; 86: System.Net.Http.dll => 0x61b9038d => 97
	i32 1639986890, ; 87: System.Text.RegularExpressions => 0x61c036ca => 108
	i32 1657153582, ; 88: System.Runtime => 0x62c6282e => 106
	i32 1658251792, ; 89: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 78
	i32 1677501392, ; 90: System.Net.Primitives.dll => 0x63fca3d0 => 99
	i32 1679769178, ; 91: System.Security.Cryptography => 0x641f3e5a => 107
	i32 1688033401, ; 92: SmallClock => 0x649d5879 => 81
	i32 1729485958, ; 93: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 56
	i32 1743415430, ; 94: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 95: System.Diagnostics.TraceSource.dll => 0x69239124 => 91
	i32 1766324549, ; 96: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 75
	i32 1770582343, ; 97: Microsoft.Extensions.Logging.dll => 0x6988f147 => 42
	i32 1780572499, ; 98: Mono.Android.Runtime.dll => 0x6a216153 => 116
	i32 1782862114, ; 99: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 100: Xamarin.AndroidX.Fragment => 0x6a96652d => 63
	i32 1793755602, ; 101: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 102: Xamarin.AndroidX.Loader => 0x6bcd3296 => 68
	i32 1813058853, ; 103: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 79
	i32 1813201214, ; 104: Xamarin.Google.Android.Material => 0x6c13413e => 78
	i32 1818569960, ; 105: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 72
	i32 1828688058, ; 106: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 43
	i32 1853025655, ; 107: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 108: System.Linq.Expressions => 0x6ec71a65 => 94
	i32 1875935024, ; 109: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 110: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 111: System.Collections.NonGeneric.dll => 0x71dc7c8b => 84
	i32 1953182387, ; 112: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 113: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 38
	i32 2003115576, ; 114: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 115: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 66
	i32 2045470958, ; 116: System.Private.Xml => 0x79eb68ee => 104
	i32 2055257422, ; 117: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 65
	i32 2066184531, ; 118: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 119: System.Diagnostics.TraceSource => 0x7b6f419e => 91
	i32 2079903147, ; 120: System.Runtime.dll => 0x7bf8cdab => 106
	i32 2090596640, ; 121: System.Numerics.Vectors => 0x7c9bf920 => 101
	i32 2127167465, ; 122: System.Console => 0x7ec9ffe9 => 89
	i32 2159891885, ; 123: Microsoft.Maui => 0x80bd55ad => 49
	i32 2169148018, ; 124: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 125: Microsoft.Extensions.Options.dll => 0x820d22b3 => 44
	i32 2192057212, ; 126: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 43
	i32 2193016926, ; 127: System.ObjectModel.dll => 0x82b6c85e => 102
	i32 2201107256, ; 128: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 80
	i32 2201231467, ; 129: System.Net.Http => 0x8334206b => 97
	i32 2207618523, ; 130: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 131: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 39
	i32 2279755925, ; 132: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 73
	i32 2298471582, ; 133: System.Net.Mail => 0x88ffe49e => 98
	i32 2303942373, ; 134: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 135: System.Private.CoreLib.dll => 0x896b7878 => 114
	i32 2353062107, ; 136: System.Net.Primitives => 0x8c40e0db => 99
	i32 2366048013, ; 137: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 138: System.Xml.ReaderWriter.dll => 0x8d24e767 => 112
	i32 2371007202, ; 139: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 38
	i32 2395872292, ; 140: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 141: System.Web.HttpUtility => 0x8f24faee => 111
	i32 2427813419, ; 142: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 143: System.Console.dll => 0x912896e5 => 89
	i32 2475788418, ; 144: Java.Interop.dll => 0x93918882 => 115
	i32 2480646305, ; 145: Microsoft.Maui.Controls => 0x93dba8a1 => 47
	i32 2503351294, ; 146: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 147: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2576534780, ; 148: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 149: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 150: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 80
	i32 2617129537, ; 151: System.Private.Xml.dll => 0x9bfe3a41 => 104
	i32 2620871830, ; 152: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 60
	i32 2626831493, ; 153: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2732626843, ; 154: Xamarin.AndroidX.Activity => 0xa2e0939b => 53
	i32 2737747696, ; 155: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 55
	i32 2740698338, ; 156: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 157: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 158: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 48
	i32 2764765095, ; 159: Microsoft.Maui.dll => 0xa4caf7a7 => 49
	i32 2778768386, ; 160: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 76
	i32 2785988530, ; 161: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 162: Microsoft.Maui.Graphics => 0xa7008e0b => 51
	i32 2810250172, ; 163: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 58
	i32 2853208004, ; 164: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 76
	i32 2861189240, ; 165: Microsoft.Maui.Essentials => 0xaa8a4878 => 50
	i32 2868488919, ; 166: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 167: System.Private.CoreLib => 0xad6f1e8a => 114
	i32 2916838712, ; 168: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 77
	i32 2919462931, ; 169: System.Numerics.Vectors.dll => 0xae037813 => 101
	i32 2959614098, ; 170: System.ComponentModel.dll => 0xb0682092 => 88
	i32 2978675010, ; 171: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 62
	i32 3038032645, ; 172: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 173: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 174: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 69
	i32 3059408633, ; 175: Mono.Android.Runtime => 0xb65adef9 => 116
	i32 3059793426, ; 176: System.ComponentModel.Primitives => 0xb660be12 => 86
	i32 3178803400, ; 177: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 70
	i32 3220365878, ; 178: System.Threading => 0xbff2e236 => 110
	i32 3258312781, ; 179: Xamarin.AndroidX.CardView => 0xc235e84d => 56
	i32 3305363605, ; 180: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 181: System.Net.Requests.dll => 0xc5b097e4 => 100
	i32 3317135071, ; 182: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 61
	i32 3346324047, ; 183: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 71
	i32 3357674450, ; 184: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 185: Xamarin.AndroidX.Core => 0xc86c06e3 => 59
	i32 3366347497, ; 186: Java.Interop => 0xc8a662e9 => 115
	i32 3374999561, ; 187: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 73
	i32 3381016424, ; 188: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 189: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 40
	i32 3452344032, ; 190: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 46
	i32 3458724246, ; 191: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 192: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 87
	i32 3476120550, ; 193: Mono.Android => 0xcf3163e6 => 117
	i32 3484440000, ; 194: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 195: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 196: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 197: System.Linq.dll => 0xd715a361 => 95
	i32 3641597786, ; 198: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 65
	i32 3643446276, ; 199: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 200: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 70
	i32 3657292374, ; 201: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 39
	i32 3660726404, ; 202: Plugin.Maui.Audio.dll => 0xda324084 => 52
	i32 3672681054, ; 203: Mono.Android.dll => 0xdae8aa5e => 117
	i32 3724971120, ; 204: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 69
	i32 3748608112, ; 205: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 90
	i32 3751619990, ; 206: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 207: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 57
	i32 3792276235, ; 208: System.Collections.NonGeneric => 0xe2098b0b => 84
	i32 3800979733, ; 209: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 46
	i32 3817368567, ; 210: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 211: System.Security.Cryptography.dll => 0xe3df9d2b => 107
	i32 3841636137, ; 212: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 41
	i32 3844307129, ; 213: System.Net.Mail.dll => 0xe52378b9 => 98
	i32 3849253459, ; 214: System.Runtime.InteropServices.dll => 0xe56ef253 => 105
	i32 3896106733, ; 215: System.Collections.Concurrent.dll => 0xe839deed => 82
	i32 3896760992, ; 216: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 59
	i32 3920221145, ; 217: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 218: System.Xml.ReaderWriter => 0xea213423 => 112
	i32 3931092270, ; 219: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 72
	i32 3955647286, ; 220: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 54
	i32 4025784931, ; 221: System.Memory => 0xeff49a63 => 96
	i32 4046471985, ; 222: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 48
	i32 4073602200, ; 223: System.Threading.dll => 0xf2ce3c98 => 110
	i32 4091086043, ; 224: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 225: Microsoft.Maui.Essentials.dll => 0xf40add04 => 50
	i32 4100113165, ; 226: System.Private.Uri => 0xf462c30d => 103
	i32 4103439459, ; 227: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 228: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 40
	i32 4150914736, ; 229: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 230: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 67
	i32 4213026141, ; 231: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 90
	i32 4249188766, ; 232: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 233: Microsoft.Maui.Controls.dll => 0xfea12dee => 47
	i32 4274623895, ; 234: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4292120959 ; 235: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 67
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [236 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 109, ; 2
	i32 33, ; 3
	i32 51, ; 4
	i32 17, ; 5
	i32 105, ; 6
	i32 32, ; 7
	i32 25, ; 8
	i32 57, ; 9
	i32 75, ; 10
	i32 88, ; 11
	i32 30, ; 12
	i32 53, ; 13
	i32 8, ; 14
	i32 64, ; 15
	i32 109, ; 16
	i32 96, ; 17
	i32 34, ; 18
	i32 28, ; 19
	i32 85, ; 20
	i32 63, ; 21
	i32 111, ; 22
	i32 113, ; 23
	i32 6, ; 24
	i32 102, ; 25
	i32 45, ; 26
	i32 27, ; 27
	i32 42, ; 28
	i32 35, ; 29
	i32 61, ; 30
	i32 19, ; 31
	i32 82, ; 32
	i32 100, ; 33
	i32 93, ; 34
	i32 25, ; 35
	i32 44, ; 36
	i32 103, ; 37
	i32 92, ; 38
	i32 10, ; 39
	i32 24, ; 40
	i32 86, ; 41
	i32 21, ; 42
	i32 14, ; 43
	i32 64, ; 44
	i32 23, ; 45
	i32 85, ; 46
	i32 74, ; 47
	i32 41, ; 48
	i32 54, ; 49
	i32 4, ; 50
	i32 94, ; 51
	i32 66, ; 52
	i32 87, ; 53
	i32 79, ; 54
	i32 113, ; 55
	i32 26, ; 56
	i32 20, ; 57
	i32 16, ; 58
	i32 22, ; 59
	i32 71, ; 60
	i32 37, ; 61
	i32 2, ; 62
	i32 62, ; 63
	i32 11, ; 64
	i32 95, ; 65
	i32 31, ; 66
	i32 52, ; 67
	i32 32, ; 68
	i32 74, ; 69
	i32 58, ; 70
	i32 0, ; 71
	i32 6, ; 72
	i32 83, ; 73
	i32 93, ; 74
	i32 55, ; 75
	i32 45, ; 76
	i32 83, ; 77
	i32 92, ; 78
	i32 81, ; 79
	i32 30, ; 80
	i32 108, ; 81
	i32 68, ; 82
	i32 77, ; 83
	i32 36, ; 84
	i32 60, ; 85
	i32 97, ; 86
	i32 108, ; 87
	i32 106, ; 88
	i32 78, ; 89
	i32 99, ; 90
	i32 107, ; 91
	i32 81, ; 92
	i32 56, ; 93
	i32 1, ; 94
	i32 91, ; 95
	i32 75, ; 96
	i32 42, ; 97
	i32 116, ; 98
	i32 17, ; 99
	i32 63, ; 100
	i32 9, ; 101
	i32 68, ; 102
	i32 79, ; 103
	i32 78, ; 104
	i32 72, ; 105
	i32 43, ; 106
	i32 26, ; 107
	i32 94, ; 108
	i32 8, ; 109
	i32 2, ; 110
	i32 84, ; 111
	i32 13, ; 112
	i32 38, ; 113
	i32 5, ; 114
	i32 66, ; 115
	i32 104, ; 116
	i32 65, ; 117
	i32 4, ; 118
	i32 91, ; 119
	i32 106, ; 120
	i32 101, ; 121
	i32 89, ; 122
	i32 49, ; 123
	i32 12, ; 124
	i32 44, ; 125
	i32 43, ; 126
	i32 102, ; 127
	i32 80, ; 128
	i32 97, ; 129
	i32 14, ; 130
	i32 39, ; 131
	i32 73, ; 132
	i32 98, ; 133
	i32 18, ; 134
	i32 114, ; 135
	i32 99, ; 136
	i32 12, ; 137
	i32 112, ; 138
	i32 38, ; 139
	i32 13, ; 140
	i32 111, ; 141
	i32 10, ; 142
	i32 89, ; 143
	i32 115, ; 144
	i32 47, ; 145
	i32 16, ; 146
	i32 11, ; 147
	i32 15, ; 148
	i32 20, ; 149
	i32 80, ; 150
	i32 104, ; 151
	i32 60, ; 152
	i32 15, ; 153
	i32 53, ; 154
	i32 55, ; 155
	i32 1, ; 156
	i32 21, ; 157
	i32 48, ; 158
	i32 49, ; 159
	i32 76, ; 160
	i32 27, ; 161
	i32 51, ; 162
	i32 58, ; 163
	i32 76, ; 164
	i32 50, ; 165
	i32 36, ; 166
	i32 114, ; 167
	i32 77, ; 168
	i32 101, ; 169
	i32 88, ; 170
	i32 62, ; 171
	i32 34, ; 172
	i32 7, ; 173
	i32 69, ; 174
	i32 116, ; 175
	i32 86, ; 176
	i32 70, ; 177
	i32 110, ; 178
	i32 56, ; 179
	i32 7, ; 180
	i32 100, ; 181
	i32 61, ; 182
	i32 71, ; 183
	i32 24, ; 184
	i32 59, ; 185
	i32 115, ; 186
	i32 73, ; 187
	i32 3, ; 188
	i32 40, ; 189
	i32 46, ; 190
	i32 22, ; 191
	i32 87, ; 192
	i32 117, ; 193
	i32 23, ; 194
	i32 31, ; 195
	i32 33, ; 196
	i32 95, ; 197
	i32 65, ; 198
	i32 28, ; 199
	i32 70, ; 200
	i32 39, ; 201
	i32 52, ; 202
	i32 117, ; 203
	i32 69, ; 204
	i32 90, ; 205
	i32 3, ; 206
	i32 57, ; 207
	i32 84, ; 208
	i32 46, ; 209
	i32 35, ; 210
	i32 107, ; 211
	i32 41, ; 212
	i32 98, ; 213
	i32 105, ; 214
	i32 82, ; 215
	i32 59, ; 216
	i32 19, ; 217
	i32 112, ; 218
	i32 72, ; 219
	i32 54, ; 220
	i32 96, ; 221
	i32 48, ; 222
	i32 110, ; 223
	i32 5, ; 224
	i32 50, ; 225
	i32 103, ; 226
	i32 29, ; 227
	i32 40, ; 228
	i32 29, ; 229
	i32 67, ; 230
	i32 90, ; 231
	i32 18, ; 232
	i32 47, ; 233
	i32 37, ; 234
	i32 67 ; 235
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
