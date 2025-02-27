import Foundation

/// The YouTubePlayer Video API
/// - Read more: https://developers.google.com/youtube/iframe_api_reference#Playback_controls
public extension YouTubePlayer {
    
    /// Plays the currently cued/loaded video
    func play() {
        self.webView.evaluate(
            javaScript: .player(function: "playVideo")
        )
    }
    
    /// Pauses the currently playing video
    func pause() {
        self.webView.evaluate(
            javaScript: .player(function: "pauseVideo")
        )
    }
    
    /// Stops and cancels loading of the current video
    func stop() {
        self.webView.evaluate(
            javaScript: .player(function: "stopVideo")
        )
    }
    
    /// Seeks to a specified time in the video
    /// - Parameters:
    ///   - seconds: The seconds parameter identifies the time to which the player should advance
    ///   - allowSeekAhead: Determines whether the player will make a new request to the server
    func seek(
        to seconds: Double,
        allowSeekAhead: Bool
    ) {
        self.webView.evaluate(
            javaScript: .player(
                function: "seekTo",
                parameters: String(seconds), String(allowSeekAhead)
            )
        )
    }
    
    /// Closes any current picture-in-picture video and fullscreen video.
    /// - Parameter completionHandler: A closure the system executes after it completes closing all media presentations.
    @available(iOS 15.0, macOS 12.0, *)
    func closeAllMediaPresentations(
        completionHandler: (() -> Void)? = nil
    ) {
        self.webView.closeAllMediaPresentations(completionHandler: completionHandler)
    }
    
    #if compiler(>=5.5) && canImport(_Concurrency)
    /// Closes any current picture-in-picture video and fullscreen video.
    @available(iOS 15.0, macOS 12.0, *)
    @MainActor
    func closeAllMediaPresentations() async {
        await self.webView.closeAllMediaPresentations()
    }
    #endif
    
}
