/*
 * whip6: Warsaw High-performance IPv6.
 *
 * Copyright (c) 2012-2017 Konrad Iwanicki
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached LICENSE     
 * files.
 */




/**
 * The default pseudo random number generator
 * for the CC2531-based platforms.
 *
 * @author Konrad Iwanicki
 */
configuration PlatformRandomPub
{
    provides
    {
        interface Init @exactlyonce();
        interface ParameterInit<uint16_t> as SeedReinit;
        interface Random;
    }
}
implementation
{
    components RandomInitFromEui64AdapterPrv as AdapterPrv;
    components new RandomLfsrPub() as ImplPrv;
    components LocalIeeeEui64ProviderPub as LocalIeeeEuid64ProviderPrv;

    Init = AdapterPrv;
    SeedReinit = ImplPrv;
    Random = ImplPrv;

    AdapterPrv.SubSeedInit -> ImplPrv;
    AdapterPrv.LocalIeeeEui64Provider -> LocalIeeeEuid64ProviderPrv;
}
