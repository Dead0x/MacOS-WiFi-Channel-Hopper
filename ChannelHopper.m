#import <CoreWLAN/CoreWLAN.h>

int main(int argc, char *argv[])
{
    @autoreleasepool
    {
        NSString *iface = [NSString stringWithUTF8String: argv[1]];
        int ch = atoi(argv[2]);
        
        NSSet * channels = [[[CWWiFiClient sharedWiFiClient] interface] supportedWLANChannels];
        
        for (CWChannel * channelObj in channels)
        {
            if ([channelObj channelNumber] == ch)
            {
                [[[CWWiFiClient sharedWiFiClient] interfaceWithName:iface] setWLANChannel:channelObj error:NULL];
                printf("Hopping to channel %ld\n", channelObj.channelNumber);
            }
        }
    }
    
    return 0;
}
