//
//  ScrollViewForwarder.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 31/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

#if os(iOS) || os(tvOS)
@_exported import Foundation
@_exported import UIKit


public protocol ScrollViewForwarder {
    
    var scrollView: UIScrollView { get }
    
}

extension GridScrollView {
    
    open var contentOffset: CGPoint {
        get { return scrollView.contentOffset }
        set { scrollView.contentOffset = newValue }
    }
    
    open var contentSize: CGSize {
        get { return scrollView.contentSize }
        set { scrollView.contentSize = newValue }
    }
    
    open var contentInset: UIEdgeInsets {
        get { return scrollView.contentInset }
        set { scrollView.contentInset = newValue }
    }
    
    #if os(iOS)
    
    @available(iOS 5.0, *)
    open var pinchGestureRecognizer: UIPinchGestureRecognizer? {
        return scrollView.pinchGestureRecognizer
    }
    
    open var scrollsToTop: Bool {
        get { return scrollView.scrollsToTop }
        set { scrollView.scrollsToTop = newValue }
    }
    
    @available(iOS 10.0, *)
    open var refreshControl: UIRefreshControl? {
        get { return scrollView.refreshControl }
        set { scrollView.refreshControl = newValue }
    }
    
    open var isPagingEnabled: Bool {
        get { return scrollView.isPagingEnabled }
        set { scrollView.isPagingEnabled = newValue }
    }
    
    @available(iOS 11.0, *)
    open var adjustedContentInset: UIEdgeInsets {
        return scrollView.adjustedContentInset
    }
    
    
    @available(iOS 11.0, *)
    open func adjustedContentInsetDidChange() {
        scrollView.adjustedContentInsetDidChange()
    }
    
    @available(iOS 11.0, *)
    open var contentInsetAdjustmentBehavior: UIScrollViewContentInsetAdjustmentBehavior {
        get { return scrollView.contentInsetAdjustmentBehavior }
        set { scrollView.contentInsetAdjustmentBehavior = newValue }
    }
    
    @available(iOS 11.0, *)
    open var contentLayoutGuide: UILayoutGuide {
        return scrollView.contentLayoutGuide
    }
    
    @available(iOS 11.0, *)
    open var frameLayoutGuide: UILayoutGuide {
        return scrollView.frameLayoutGuide
    }
    
    #elseif os(tvOS)
    
    @available(tvOS 11.0, *)
    open var adjustedContentInset: UIEdgeInsets {
        return scrollView.adjustedContentInset
    }
    
    
    @available(tvOS 11.0, *)
    open func adjustedContentInsetDidChange() {
        scrollView.adjustedContentInsetDidChange()
    }
    
    @available(tvOS 11.0, *)
    open var contentInsetAdjustmentBehavior: UIScrollViewContentInsetAdjustmentBehavior {
        get { return scrollView.contentInsetAdjustmentBehavior }
        set { scrollView.contentInsetAdjustmentBehavior = newValue }
    }
    
    @available(tvOS 11.0, *)
    open var contentLayoutGuide: UILayoutGuide {
        return scrollView.contentLayoutGuide
    }
    
    @available(tvOS 11.0, *)
    open var frameLayoutGuide: UILayoutGuide {
        return scrollView.frameLayoutGuide
    }
    
    #endif
    
    weak open var delegate: UIScrollViewDelegate? {
        get { return scrollView.delegate }
        set { scrollView.delegate = newValue }
    }
    
    open var isDirectionalLockEnabled: Bool {
        get { return scrollView.isDirectionalLockEnabled }
        set { scrollView.isDirectionalLockEnabled = newValue }
    }
    
    open var bounces: Bool {
        get { return scrollView.bounces }
        set { scrollView.bounces = newValue }
    }
    
    open var alwaysBounceVertical: Bool {
        get { return scrollView.alwaysBounceVertical }
        set { scrollView.alwaysBounceVertical = newValue }
    }
    
    open var alwaysBounceHorizontal: Bool {
        get { return scrollView.alwaysBounceHorizontal }
        set { scrollView.alwaysBounceHorizontal = newValue }
    }
    
    open var isScrollEnabled: Bool {
        get { return scrollView.isScrollEnabled }
        set { scrollView.isScrollEnabled = newValue }
    }
    
    open var showsHorizontalScrollIndicator: Bool {
        get { return scrollView.showsHorizontalScrollIndicator }
        set { scrollView.showsHorizontalScrollIndicator = newValue }
    }
    
    open var showsVerticalScrollIndicator: Bool {
        get { return scrollView.showsVerticalScrollIndicator }
        set { scrollView.showsVerticalScrollIndicator = newValue }
    }
    
    open var scrollIndicatorInsets: UIEdgeInsets {
        get { return scrollView.contentInset }
        set { scrollView.contentInset = newValue }
    }
    
    open var indicatorStyle: UIScrollViewIndicatorStyle {
        get { return scrollView.indicatorStyle }
        set { scrollView.indicatorStyle = newValue }
    }
    
    @available(iOS 3.0, *)
    open var decelerationRate: CGFloat {
        get { return scrollView.decelerationRate }
        set { scrollView.decelerationRate = newValue }
    }
    
    open var indexDisplayMode: UIScrollViewIndexDisplayMode {
        get { return scrollView.indexDisplayMode }
        set { scrollView.indexDisplayMode = newValue }
    }
    
    open func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        scrollView.setContentOffset(contentOffset, animated: animated)
    }
    
    open func scrollRectToVisible(_ rect: CGRect, animated: Bool) {
        scrollView.scrollRectToVisible(rect, animated: animated)
    }
    
    
    open func flashScrollIndicators() {
        scrollView.flashScrollIndicators()
    }
    
    open var isTracking: Bool {
        return scrollView.isTracking
    }
    
    open var isDragging: Bool {
        return scrollView.isDragging
    }
    
    open var isDecelerating: Bool {
        return scrollView.isDecelerating
    }
    
    
    open var delaysContentTouches: Bool {
        get { return scrollView.delaysContentTouches }
        set { scrollView.delaysContentTouches = newValue }
    }
    
    open var canCancelContentTouches: Bool {
        get { return scrollView.canCancelContentTouches }
        set { scrollView.canCancelContentTouches = newValue }
    }
    
    open func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: ViewAlias) -> Bool {
        return touchesShouldBegin(touches, with: event, in: view)
    }
    
    open func touchesShouldCancel(in view: ViewAlias) -> Bool {
        return touchesShouldCancel(in: view)
    }
    
    open var minimumZoomScale: CGFloat {
        get { return scrollView.minimumZoomScale }
        set { scrollView.minimumZoomScale = newValue }
    }
    
    open var maximumZoomScale: CGFloat {
        get { return scrollView.maximumZoomScale }
        set { scrollView.maximumZoomScale = newValue }
    }
    
    @available(iOS 3.0, *)
    open var zoomScale: CGFloat {
        get { return scrollView.zoomScale }
        set { scrollView.zoomScale = newValue }
    }
    
    @available(iOS 3.0, *)
    open func setZoomScale(_ scale: CGFloat, animated: Bool) {
        scrollView.setZoomScale(scale, animated: animated)
    }
    
    @available(iOS 3.0, *)
    open func zoom(to rect: CGRect, animated: Bool) {
        scrollView.zoom(to: rect, animated: animated)
    }
    
    open var bouncesZoom: Bool {
        get { return scrollView.bouncesZoom }
        set { scrollView.bouncesZoom = newValue }
    }
    
    open var isZooming: Bool {
        return scrollView.isZooming
    }
    
    open var isZoomBouncing: Bool {
        return scrollView.isZoomBouncing
    }
    
    @available(iOS 5.0, *)
    open var panGestureRecognizer: UIPanGestureRecognizer {
        return scrollView.panGestureRecognizer
    }
    
    open var directionalPressGestureRecognizer: UIGestureRecognizer {
        return scrollView.directionalPressGestureRecognizer
    }
    
    @available(iOS 7.0, *)
    open var keyboardDismissMode: UIScrollViewKeyboardDismissMode {
        get { return scrollView.keyboardDismissMode }
        set { scrollView.keyboardDismissMode = newValue }
    }
    
}

#endif
